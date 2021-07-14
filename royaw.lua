--local variables for API functions. Generated using https://github.com/sapphyrus/gamesense-lua/blob/master/generate_api.lua
local client_userid_to_entindex, client_set_event_callback, client_screen_size, client_trace_bullet, client_unset_event_callback, client_color_log, client_reload_active_scripts, client_scale_damage, client_get_cvar, client_camera_position, client_create_interface, client_random_int, client_latency, client_set_clan_tag, client_find_signature, client_log, client_timestamp, client_delay_call, client_trace_line, client_register_esp_flag, client_get_model_name, client_system_time, client_visible, client_exec, client_key_state, client_set_cvar, client_unix_time, client_error_log, client_draw_debug_text, client_update_player_list, client_camera_angles, client_eye_position, client_draw_hitboxes, client_random_float = client.userid_to_entindex, client.set_event_callback, client.screen_size, client.trace_bullet, client.unset_event_callback, client.color_log, client.reload_active_scripts, client.scale_damage, client.get_cvar, client.camera_position, client.create_interface, client.random_int, client.latency, client.set_clan_tag, client.find_signature, client.log, client.timestamp, client.delay_call, client.trace_line, client.register_esp_flag, client.get_model_name, client.system_time, client.visible, client.exec, client.key_state, client.set_cvar, client.unix_time, client.error_log, client.draw_debug_text, client.update_player_list, client.camera_angles, client.eye_position, client.draw_hitboxes, client.random_float
local entity_get_local_player, entity_is_enemy, entity_get_bounding_box, entity_get_all, entity_set_prop, entity_is_alive, entity_get_steam64, entity_get_classname, entity_get_player_resource, entity_get_esp_data, entity_is_dormant, entity_get_player_name, entity_get_game_rules, entity_get_origin, entity_hitbox_position, entity_get_player_weapon, entity_get_players, entity_get_prop = entity.get_local_player, entity.is_enemy, entity.get_bounding_box, entity.get_all, entity.set_prop, entity.is_alive, entity.get_steam64, entity.get_classname, entity.get_player_resource, entity.get_esp_data, entity.is_dormant, entity.get_player_name, entity.get_game_rules, entity.get_origin, entity.hitbox_position, entity.get_player_weapon, entity.get_players, entity.get_prop
local globals_realtime, globals_absoluteframetime, globals_chokedcommands, globals_oldcommandack, globals_tickcount, globals_commandack, globals_lastoutgoingcommand, globals_curtime, globals_mapname, globals_tickinterval, globals_framecount, globals_frametime, globals_maxplayers = globals.realtime, globals.absoluteframetime, globals.chokedcommands, globals.oldcommandack, globals.tickcount, globals.commandack, globals.lastoutgoingcommand, globals.curtime, globals.mapname, globals.tickinterval, globals.framecount, globals.frametime, globals.maxplayers
local ui_new_slider, ui_new_combobox, ui_reference, ui_set_visible, ui_new_textbox, ui_new_color_picker, ui_new_checkbox, ui_mouse_position, ui_new_listbox, ui_new_multiselect, ui_is_menu_open, ui_new_hotkey, ui_set, ui_update, ui_menu_size, ui_name, ui_menu_position, ui_set_callback, ui_new_button, ui_new_label, ui_new_string, ui_get = ui.new_slider, ui.new_combobox, ui.reference, ui.set_visible, ui.new_textbox, ui.new_color_picker, ui.new_checkbox, ui.mouse_position, ui.new_listbox, ui.new_multiselect, ui.is_menu_open, ui.new_hotkey, ui.set, ui.update, ui.menu_size, ui.name, ui.menu_position, ui.set_callback, ui.new_button, ui.new_label, ui.new_string, ui.get
local me = entity_get_local_player()
local renderer_indicator = client.screen_size
---menu check
local text2 = {
	label = ui.new_label("AA", "Anti-aimbot angles", " "),
	label = ui.new_label("AA", "Anti-aimbot angles", "                          R O Y A W      "),
	label = ui.new_label("AA", "Anti-aimbot angles", "|───────────────────────────────|"),

}
local function line_break()
	ui.new_label("AA", "Anti-aimbot angles", "|───────────────────────────────|")
end
--end of local variables
local function contains(table, val)
	for i=1, #table do
		if table[i] == val then
			return true
		end
	end

	return false
end
--lua
local function draw_container(x, y, w, h, header, a)
	local c = {10, 60, 40, 40, 40, 60, 20}

	for i = 0,6,1 do
		renderer.rectangle(x+i, y+i, w-(i*2), h-(i*2), c[i+1], c[i+1], c[i+1], a)
	end

	if header then
		local x_inner, y_inner = x+7, y+7
		local w_inner = w-14

		renderer.gradient(x_inner, y_inner - 1, math.floor(w_inner/2), 1, m_r, m_g, m_b, a, mt_r, mt_g, mt_b, a, true)
		renderer.gradient(x_inner+math.floor(w_inner/2), y_inner - 1, math.ceil(w_inner/2), 1, mt_r, mt_g, mt_b, a, m_r, m_g, m_b, a, true)

		local a_lower = a
		renderer.gradient(x_inner, y_inner, math.floor(w_inner/2), 1, 59, 175, 222, a_lower, 202, 70, 205, a_lower, true)
		renderer.gradient(x_inner+math.floor(w_inner/2), y_inner, math.ceil(w_inner/2), 1, 202, 70, 205, a_lower, 201, 227, 58, a_lower, true)
	end
end


-- LUA library requirements
local http = require "gamesense/http"
local images = require "gamesense/images"
require 'bit'
--[[

]]
local enable_lua = ui_new_checkbox("AA", "Anti-aimbot angles", "                 Royaw Master switch")
line_break()
local override_antiaim = ui_new_checkbox("AA", "Anti-aimbot angles", "Running Royaw AA")
local adaptive_fs = ui_new_checkbox("AA", "Anti-aimbot angles", "Reversed Body yaw")
local manual_aa = ui_new_checkbox("AA", "Anti-aimbot angles", "Manual direction")
local manual_aa_clr = ui_new_color_picker("AA", "Anti-aimbot angles", "Manual direction", 255, 255, 255, 255)
local manual_left = ui_new_hotkey("AA", "Anti-aimbot angles", "Manual left")
local manual_right = ui_new_hotkey("AA", "Anti-aimbot angles", "Manual right")
local manual_back = ui_new_hotkey("AA", "Anti-aimbot angles", "Manual back")
local manual_state = ui_new_slider("AA", "Anti-aimbot angles", "Manual direction", 0, 2, 0)
local legit_aa_use = ui_new_checkbox("AA", "Anti-aimbot angles", "Legit AA On E")
local legit_aa_rebind = ui.new_hotkey("AA", "Anti-aimbot angles", "Legit AA on Bind Key")
local change_aa_on_key = ui.new_hotkey("AA", "Anti-aimbot angles", "Brute DODGE")
local edge_key = ui.new_checkbox("AA", "Anti-aimbot angles", "Situational Edge yaw")
local weapon_check = ui_new_checkbox("AA", "Anti-aimbot angles", "Situational Freestanding")
line_break()
local aa_legs = ui.new_multiselect("AA", "Anti-aimbot angles", "Modified leg", {"Static legs in air", "Break leg animation"})
local adaptive_fakelag = ui_new_checkbox("AA", "Anti-aimbot angles", "Break fakelag")
local backtrack = ui.new_checkbox("AA", "Anti-aimbot angles", "Dynamic Increase backtrack")
line_break()
local desync_line = ui_new_checkbox("AA", "Anti-aimbot angles", "Desync gradient & 'royaw'")
local label4 = ui_new_label("AA", "Anti-aimbot angles", "Desync gradient inside")
local primary_gradient = ui_new_color_picker("AA", "Anti-aimbot angles", "Desync gradient inside", 255, 255, 255, 255)
local label5 = ui_new_label("AA", "Anti-aimbot angles", "Desync gradient outside")
local secondary_gradient = ui_new_color_picker("AA", "Anti-aimbot angles", "Desync gradient outside", 255, 255, 255, 255)
local side_arrows = ui_new_checkbox("AA", "Anti-aimbot angles", "Body yaw arrows")
local side_arrows_clr = ui_new_color_picker("AA", "Anti-aimbot angles", "Body yaw arrows color", 255, 255, 255, 255)
local on_peek_arrows = ui_new_checkbox("AA", "Anti-aimbot angles", "On peek indicators")
local on_peek_arrows_clr = ui_new_color_picker("AA", "Anti-aimbot angles", "On peek indicators color", 255, 255, 255, 255)
local indicator_arrow = ui_new_combobox("AA", "Anti-aimbot angles", "Arrows", {"simple arrow", "OT like", "Moderen"})
local indicator_type = ui_new_combobox("AA", "Anti-aimbot angles", "Indicator Font", "Default", "Small", "Bold")
local indicators = ui_new_multiselect("AA", "Anti-aimbot angles", "Indicator list", "Doubletap", "Min damage", "Fakeduck", "Hideshots", "Force body aim", "Force safepoint" , "Hide skeet default")
local indicator_info_clr = ui_new_color_picker("AA", "Anti-aimbot angles", "Indicator color", 255, 255, 255, 255)
line_break()



--



--[[
Menu references
]]
local enabled_1 = ui_reference ("AA", "Anti-aimbot angles", "Enabled")
local ref_md = ui_reference("RAGE", "Aimbot", "Minimum damage")
local ref_sp_key = ui_reference("RAGE", "Aimbot", "Force SAFE point")
local ref_baim_key = ui_reference("RAGE", "Other", "Force body aim")
local ref_fd = ui_reference("RAGE", "Other", "Duck peek assist")
local ref_dt, ref_dt_key = ui_reference("RAGE", "Other", "Double tap")
local ref_dt_mode = ui_reference("RAGE", "Other", "Double tap mode")
local ref_dt_hc = ui_reference("RAGE", "Other", "Double tap hit chance")
local ref_dt_fl = ui_reference("RAGE", "Other", "Double tap fake lag limit")
local ref_pitch = ui_reference("AA", "Anti-aimbot angles", "Pitch")
local ref_yaw, ref_yawadd = ui_reference("AA", "Anti-aimbot angles", "Yaw")
local ref_yaw_base = ui_reference("AA", "Anti-aimbot angles", "Yaw base")
local ref_yawj, ref_yawjadd = ui_reference("AA", "Anti-aimbot angles", "Yaw jitter")
local edge_yaw = ui.reference("AA", "Anti-aimbot angles", "Edge yaw")
local ref_bodyyaw, ref_bodyyawadd = ui_reference("AA", "Anti-aimbot angles", "Body yaw")
local ref_fs_bodyyaw = ui_reference("AA", "Anti-aimbot angles", "Freestanding body yaw")
local ref_fs  , ref_fs_key= ui_reference("AA", "Anti-aimbot angles", "Freestanding")
local fs , fs_key = ui_reference("AA", "Anti-aimbot angles", "Freestanding")
local ref_fakelimit = ui_reference("AA", "Anti-aimbot angles", "Fake yaw limit")
local ref_hs, ref_hs_key= ui_reference("AA", "Other", "On shot anti-aim")
local ref_fl = ui_reference("AA", "Fake lag", "Enabled")
local ref_fl_amt = ui_reference("AA", "Fake lag", "Amount")
local ref_fl_var = ui_reference("AA", "Fake lag", "Variance")
local ref_fl_limit = ui_reference("AA", "Fake lag", "Limit")
local mindmg = ui.reference("RAGE", "Aimbot", "Minimum damage")
local ref_maxprocessticks = ui_reference("MISC", "Settings", "sv_maxusrcmdprocessticks")
local dt_hit_chance = ui.reference("RAGE", "Other", "Double tap hit chance")
local fakelag = ui.reference("AA", "Fake lag", "Limit")
local ground_ticks, end_time = 1, 0
local best_enemy = nil

local brute = {
	yaw_status = "DEFAULT",
	indexed_angle = 0,
	last_miss = 0,
	best_angle = 0,
	misses = { },
	hit_reverse = { }
}

----Situational freestanding
client_set_event_callback("run_command", function(c)
if ui_get(weapon_check) then
	local local_player = entity_get_local_player()
	if local_player ~= nil then
		local weapon = entity_get_player_weapon(local_player)
		local item = entity_get_prop(weapon, "m_iItemDefinitionIndex")
		if item ~= nil then
			if(item == 9 or item == 40) then ---- 9  = awp  40 = scout
				ui_set(fs,"Default")
				ui_set(fs_key, "always on")
			else
				ui_set(fs,"Default")
				ui_set(fs_key, "Toggle")
			end
		end
	end
end
end)



local function includes(table, key)
	for i=1, #table do
		if table[i] == key then
			return true
		end
	end
	return false
end



local function normalize_yaw(yaw)
	while yaw > 180 do yaw = yaw - 360 end
		while yaw < -180 do yaw = yaw + 360 end
			return yaw
		end

		local function calc_angle(local_x, local_y, enemy_x, enemy_y)
			local ydelta = local_y - enemy_y
			local xdelta = local_x - enemy_x
			local relativeyaw = math.atan( ydelta / xdelta )
			relativeyaw = normalize_yaw( relativeyaw * 180 / math.pi )
			if xdelta >= 0 then
				relativeyaw = normalize_yaw(relativeyaw + 180)
			end
			return relativeyaw
		end

		local function ang_on_screen(x, y)
			if x == 0 and y == 0 then return 0 end

			return math.deg(math.atan2(y, x))
		end

		local vec_3 = function(_x, _y, _z)
		return { x = _x or 0, y = _y or 0, z = _z or 0 }
	end

	local function angle_vector(angle_x, angle_y)
		local sy = math.sin(math.rad(angle_y))
		local cy = math.cos(math.rad(angle_y))
		local sp = math.sin(math.rad(angle_x))
		local cp = math.cos(math.rad(angle_x))
		return cp * cy, cp * sy, -sp
	end

	local function get_damage(me, enemy, x, y,z)
		local ex = { }
		local ey = { }
		local ez = { }
		ex[0], ey[0], ez[0] = entity_hitbox_position(enemy, 1)
		ex[1], ey[1], ez[1] = ex[0] + 40, ey[0], ez[0]
		ex[2], ey[2], ez[2] = ex[0], ey[0] + 40, ez[0]
		ex[3], ey[3], ez[3] = ex[0] - 40, ey[0], ez[0]
		ex[4], ey[4], ez[4] = ex[0], ey[0] - 40, ez[0]
		ex[5], ey[5], ez[5] = ex[0], ey[0], ez[0] + 40
		ex[6], ey[6], ez[6] = ex[0], ey[0], ez[0] - 40
		local bestdamage = 0
		local bent = nil
		for i=0, 6 do
			local ent, damage = client_trace_bullet(enemy, ex[i], ey[i], ez[i], x, y, z)
			if damage > bestdamage then
				bent = ent
				bestdamage = damage
			end
		end
		return bent == nil and client_scale_damage(me, 1, bestdamage) or bestdamage
	end

	local function is_auto_vis(local_player,lx,ly,lz,px,py,pz)
		entindex,dmg = client_trace_bullet(local_player,lx,ly,lz,px,py,pz)
		if entindex == nil then
			return false
		end
		if entindex == local_player then
			return false
		end
		if not entity_is_enemy(entindex) then
			return false
		end
		if dmg >  ref_md then
			return true
		else
			return false
		end
	end

	local function trace_positions(px,py,pz,px1,py1,pz1,px2,py2,pz2,lx2,ly2,lz2)
		if is_auto_vis(local_player,lx2,ly2,lz2,px,py,pz) then
			return true
		end
		if is_auto_vis(local_player,lx2,ly2,lz2,px1,py1,pz1) then
			return true
		end
		if is_auto_vis(local_player,lx2,ly2,lz2,px2,py2,pz2) then
			return true
		end
		return false
	end

	local function extrapolate_position(xpos,ypos,zpos,ticks,ent)
		x,y,z = entity_get_prop(ent, "m_vecVelocity")
		for i=0, ticks do
			xpos =  xpos + (x*globals_tickinterval())
			ypos =  ypos + (y*globals_tickinterval())
			zpos =  zpos + (z*globals_tickinterval())
		end
		return xpos,ypos,zpos
	end

	local function get_best_enemy()
		-- We store the best target in a global variable so we don't have to re run the calculations every time we want to find the best target.
		best_enemy = nil

		local enemies = entity_get_players(true)
		local best_fov = 90

		local lx, ly, lz = client_eye_position()
		local view_x, view_y, roll = client_camera_angles()

		for i=1, #enemies do
			local cur_x, cur_y, cur_z = entity_get_prop(enemies[i], "m_vecOrigin")
			local cur_fov = math.abs(normalize_yaw(ang_on_screen(lx - cur_x, ly - cur_y) - view_y + 180))
			if cur_fov < best_fov then
				best_fov = cur_fov
				best_enemy = enemies[i]
			end
		end
	end
	local function ticks_to_time(ticks)
		return globals.tickinterval() * ticks
	end
	local get_flags = function(ent)
	local state = "stand"

	local flags = entity.get_prop(ent, "m_fFlags")
	local vel_prop = vec_3(entity.get_prop(ent, "m_vecVelocity"))
	local velocity = math.floor(math.min(10000, math.sqrt(vel_prop.x^2 + vel_prop.y^2) + 0.5))

	if bit.band(flags, 1) ~= 1 then state = "air" else
	if (entity.get_prop(ent, "m_flDuckAmount") > 0.7) then
		state = "duck"
	elseif velocity > 1 then
		if velocity <= 120 then
			state = "slow"
		else
			state = "move"
		end
	else
		state = "stand"
	end
end

return {
	velocity = velocity,
	state = state
}
end


local function get_best_angle()
-- Since we run this from run_command no need to check if we are alive or anything.
local me = entity_get_local_player()

brute.best_angle = 0

if not ui_get(override_antiaim) then return end

if best_enemy == nil then return end

local lx, ly, lz = client_eye_position()
local view_x, view_y, roll = client_camera_angles()

local e_x, e_y, e_z = entity_hitbox_position(best_enemy, 0)

local yaw = calc_angle(lx, ly, e_x, e_y)
local rdir_x, rdir_y, rdir_z = angle_vector(0, (yaw + 90))
local rend_x = lx + rdir_x * 10
local rend_y = ly + rdir_y * 10

local ldir_x, ldir_y, ldir_z = angle_vector(0, (yaw - 90))
local lend_x = lx + ldir_x * 10
local lend_y = ly + ldir_y * 10

local r2dir_x, r2dir_y, r2dir_z = angle_vector(0, (yaw + 90))
local r2end_x = lx + r2dir_x * 100
local r2end_y = ly + r2dir_y * 100

local l2dir_x, l2dir_y, l2dir_z = angle_vector(0, (yaw - 90))
local l2end_x = lx + l2dir_x * 100
local l2end_y = ly + l2dir_y * 100

local ldamage = get_damage(me, best_enemy, rend_x, rend_y, lz)
local rdamage = get_damage(me, best_enemy, lend_x, lend_y, lz)

local l2damage = get_damage(me, best_enemy, r2end_x, r2end_y, lz)
local r2damage = get_damage(me, best_enemy, l2end_x, l2end_y, lz)

if l2damage > r2damage or ldamage > rdamage then
	if ui_get(adaptive_fs) then
		brute.best_angle = (brute.hit_reverse[best_enemy] == nil and 1 or 2)
	else
		brute.best_angle = 1
	end
elseif r2damage > l2damage or rdamage > ldamage then
	if ui_get(adaptive_fs) then
		brute.best_angle = (brute.hit_reverse[best_enemy] == nil and 2 or 1)
	else
		brute.best_angle = 2
	end
end
local flags = entity.get_prop(entity.get_local_player(), "m_fFlags")
local is_air = flags == 256
if is_air or manual_back then
	ui.set(ref_yaw_base, "At targets")
else
	ui.set(ref_yaw_base, "Local view")
end
ui.set(edge_yaw, not is_air and not ui.get(ref_fd) and ui.get(enable_lua) and ui.get(edge_key))
end

local function doubletap_charged()
-- Make sure we have doubletap enabled, are holding our doubletap key & we aren't fakeducking.
if not ui_get(ref_dt) or not ui_get(ref_dt_key) or ui_get(ref_fd) then return false end

-- Get our local player.
local me = entity_get_local_player()

-- Sanity checks on local player (since paint & a few other events run even when dead).
if me == nil or not entity_is_alive(me) then return false end

-- Get our local players weapon.
local weapon = entity_get_prop(me, "m_hActiveWeapon")

-- Make sure that it is valid.
if weapon == nil then return false end

-- Basic definitions used to calculate if we have recently shot or swapped weapons.
local next_attack = entity_get_prop(me, "m_flNextAttack") + 0.25
local next_primary_attack = entity_get_prop(weapon, "m_flNextPrimaryAttack") + 0.5

-- Make sure both values are valid.
if next_attack == nil or next_primary_attack == nil then return false end

-- Return if both are under 0 meaning our doubletap is charged / we can fire (you can also use these values as a 2nd return parameter to get the charge %).
return next_attack - globals_curtime() < 0 and next_primary_attack - globals_curtime() < 0
end

local nonweapons_c =
{
"CKnife",
"CHEGrenade",
"CMolotovGrenade",
"CIncendiaryGrenade",
"CFlashbang",
"CDecoyGrenade",
"CSmokeGrenade",
"CWeaponTaser",
"CC4"
}



local multi_exec = function(func, list)
if func == nil then
return
end

for ref, val in pairs(list) do
func(ref, val)
end
end

local compare = function(tab, val)
for i = 1, #tab do
if tab[i] == val then
return true
end
end

return false
end

local bind_system = {
LEFT = false,
RIGHT = false,
}

multi_exec(ui_set_visible, {
[manual_aa_clr] = false,
[manual_left] = false,
[manual_right] = false,
[manual_back] = false,
[manual_state] = false,
})

function bind_system:update()
ui_set(manual_left, "On hotkey")
ui_set(manual_right, "On hotkey")
ui_set(manual_back, "On hotkey")

local m_state = ui_get(manual_state)

local left_state, right_state, back_state =
ui_get(manual_left),
ui_get(manual_right),
ui_get(manual_back)

if  left_state == self.LEFT and
back_state == self.BACK and
right_state == self.RIGHT then
return
end

self.LEFT, self.RIGHT, self.BACK = left_state, right_state, back_state

if (left_state and m_state == 1) or (right_state and m_state == 2) then
ui_set(manual_state, 0)
return
end

if left_state and m_state ~= 1 then
ui_set(manual_state, 1)
end

if right_state and m_state ~= 2 then
ui_set(manual_state, 2)
end
if back_state and m_state ~= 0 then
ui_set(manual_state, 0)
end
end

local on_manual_enabled = function(e, menu_call)
local state = not ui_get(manual_aa)
multi_exec(ui_set_visible, {
[manual_aa_clr] = not state,
[manual_left] = not state,
[manual_right] = not state,
[manual_back] = not state,
[manual_state] = false,
})
end

ui_set_callback(manual_aa, on_manual_enabled)

local function manual_aa_sc()
if not ui_get(manual_aa) then
return
end

local direction = ui_get(manual_state)

local manual_yaw = {
[0] = 0,
[1] = -90, [2] = 90
}

if direction == 1 or direction == 2 then
ui_set(ref_yaw_base, "Local view")
else
ui_set(ref_yaw_base, "At targets")
end

ui_set(ref_yawadd, manual_yaw[direction])
end

local function manual_aa_paint()
on_manual_enabled(true, true)
bind_system:update()

local me = entity_get_local_player()
local w, h = client_screen_size()

if not entity_is_alive(me) or not ui_get(manual_aa) then
return
end

local r, g, b, a = ui_get(manual_aa_clr)
local m_state = ui_get(manual_state)

local realtime = globals_realtime() % 3
local alpha = math.floor(math.sin(realtime * 4) * (a/2-1) + a/2) or a

if m_state == 1 and ui_get(indicator_arrow) == "simple arrow" then renderer.text(w/2 - 40, h / 2 - 1, 0, 0, 0, 125, "cb", 0, "❰") end
if m_state == 2 and ui_get(indicator_arrow) == "simple arrow"then renderer.text(w/2 + 40, h / 2 - 1, 0, 0, 0, 125, "cb", 0, "❱") end


if m_state == 1 and ui_get(indicator_arrow) == "simple arrow"then renderer.text(w/2 - 40, h / 2 - 1, r, g, b, alpha, "cb", 0, "❰") end
if m_state == 2 and ui_get(indicator_arrow) == "simple arrow"then renderer.text(w/2 + 40, h / 2 - 1, r, g, b, alpha, "cb", 0, "❱") end


if m_state == 1 and ui_get(indicator_arrow) == "OT like" then renderer.text(w/2 - 40, h / 2 - 1, 0, 0, 0, 125, "c", 0, "◁") end
if m_state == 2 and ui_get(indicator_arrow) == "OT like"then renderer.text(w/2 + 40, h / 2 - 1, 0, 0, 0, 125, "c", 0, "▷") end


if m_state == 1 and ui_get(indicator_arrow) == "OT like"then renderer.text(w/2 - 40, h / 2 - 1, r, g, b, alpha, "c", 0, "◁") end
if m_state == 2 and ui_get(indicator_arrow) == "OT like"then renderer.text(w/2 + 40, h / 2 - 1, r, g, b, alpha, "c", 0, "▷") end

if m_state == 1 and ui_get(indicator_arrow) == "Moderen" then renderer.text(w/2 - 40, h / 2 - 1, 0, 0, 0, 125, "c", 0, "⮘") end
if m_state == 2 and ui_get(indicator_arrow) == "Moderen"then renderer.text(w/2 + 40, h / 2 - 1, 0, 0, 0, 125, "c", 0, "⮚") end


if m_state == 1 and ui_get(indicator_arrow) == "Moderen"then renderer.text(w/2 - 40, h / 2 - 1, r, g, b, alpha, "c", 0, "⮘") end
if m_state == 2 and ui_get(indicator_arrow) == "Moderen"then renderer.text(w/2 + 40, h / 2 - 1, r, g, b, alpha, "c", 0, "⮚") end

end

local function set_anti_aim(type)
if type == "ANTIRESOLVER" then
ui_set(ref_pitch , "down")
ui_set(ref_yaw, "180")
ui_set(ref_yawadd, 0)
ui_set(ref_yawj, "Offset")
ui_set(ref_yawjadd, -10)
ui_set(ref_bodyyaw, "JITTER")
ui_set(ref_bodyyawadd, 0)
ui_set(ref_fs_bodyyaw, false)
ui_set(ref_fakelimit, 59)

elseif type == "RIGHT" then
ui_set(ref_pitch , "down")
ui_set(ref_yaw, "180")
ui_set(ref_yawadd, -4)
ui_set(ref_yawj, "off")
ui_set(ref_yawjadd, 0)
ui_set(ref_bodyyaw, "Static")
ui_set(ref_bodyyawadd, 170)
ui_set(ref_fs_bodyyaw, false)
ui_set(ref_fakelimit, 40)

elseif type == "LEFT" then
ui_set(ref_pitch , "down")
ui_set(ref_yaw, "180")
ui_set(ref_yawadd, 6)
ui_set(ref_yawj, "off")
ui_set(ref_yawjadd, 0)
ui_set(ref_bodyyaw, "Static")
ui_set(ref_bodyyawadd, - 170)
ui_set(ref_fs_bodyyaw, false)
ui_set(ref_fakelimit, 59)

elseif type == "MANUAL" then
ui_set(ref_pitch , "down")
ui_set(ref_yaw, "180")
ui_set(ref_yawj, "Off")
ui_set(ref_yawjadd, 0)
ui_set(ref_bodyyaw, "Static")
ui_set(ref_bodyyawadd, 90)
ui_set(ref_fs_bodyyaw, false)
ui_set(ref_fakelimit, 60)

elseif type == "DODGE" then
ui_set(ref_pitch , "down")
ui.set(ref_yawadd,0)
ui.set(ref_yawj,"offset")
ui.set(ref_yawjadd,6)
ui.set(ref_bodyyaw, "static")
ui.set(ref_bodyyawadd, 31)
ui_set(ref_fs_bodyyaw, false)
ui.set(ref_fakelimit, math.random(22,31))
ui.set(edge_yaw , false)

elseif type == "LEGIT" then
ui.set(ref_pitch, "Off")
ui.set(ref_yawadd, 180)
ui.set(ref_bodyyaw, "jitter")
ui.set(ref_bodyyawadd, 0)
ui_set(ref_fs_bodyyaw, true)
ui.set(ref_fakelimit, 60)

end
end

local function anti_aim()
brute.yaw_status = "DEFAULT"

if not ui_get(override_antiaim) then return end


if ui_get(manual_aa) and ui_get(manual_state) ~= 0 then
brute.yaw_status = "MANUAL"
set_anti_aim("MANUAL")
return
end

if brute.best_angle == 0 then
if best_enemy == nil then
brute.yaw_status = "ANTIRESOLVER"
brute.indexed_angle = 0
set_anti_aim("ANTIRESOLVER")
elseif brute.indexed_angle ~= 0 then
if brute.indexed_angle == 1 then
if brute.misses[best_enemy] == nil then
	brute.yaw_status = "PREDICTED"
	set_anti_aim("LEFT")
elseif brute.misses[best_enemy] == 1 then
	brute.yaw_status = "PREDICTED"
	set_anti_aim("RIGHT")
else
	brute.yaw_status = "PREDICTED"
	set_anti_aim("LEFT")
end
else
if brute.misses[best_enemy] == nil then
	brute.yaw_status = "PREDICTED"
	set_anti_aim("RIGHT")
else
	brute.yaw_status = "PREDICTED"
	set_anti_aim("LEFT")
end
end
end
elseif brute.best_angle == 1 then
brute.indexed_angle = 1
if brute.misses[best_enemy] == nil then
brute.yaw_status = "DYNAMIC:R"
set_anti_aim("LEFT")
elseif brute.misses[best_enemy] == 1 then
brute.yaw_status = "RESET:L"
set_anti_aim("RIGHT")
else
brute.yaw_status = "DYNAMIC:R"
set_anti_aim("LEFT")
end
else
brute.indexed_angle = 2
if brute.misses[best_enemy] == nil then
brute.yaw_status = "DYNAMIC:L"
set_anti_aim("RIGHT")
else
brute.yaw_status = "RESET:R"
set_anti_aim("LEFT")

end
end
if ui_get(change_aa_on_key) then
brute.yaw_status = "DODGE"
set_anti_aim("DODGE")
end
if ui_get(legit_aa_rebind) then
brute.yaw_status = "LEGIT AA"
set_anti_aim("LEGIT")
end 
	if ui_get(legit_aa_use) and client.key_state(0x45) then
	       brute.yaw_status = "LEGIT AA"
		   end

end
local function draw_indicator_circle(x, y, r, g, b, a, percentage, outline)
local outline = outline == nil and true or outline
local radius = 4
local start_degrees = 0

if outline then
renderer.circle_outline(x, y, 0, 0, 0, 200, radius, start_degrees, 2, 4)
end
renderer.circle_outline(x, y, r, g, b, a, radius-1, start_degrees, percentage, 1.5)
local choked_ticks = 0
if choked_ticks > 15 then ticks = 1 else ticks = choked_ticks*0.066
end
end



local function draw()
if not entity_is_alive(entity_get_local_player()) then return end
local w, h = client_screen_size()
local percentage = 60 * (1 / 360)
local p_r, p_g, p_b, p_a = ui_get(primary_gradient)
local a_r, a_g, a_b, a_a = ui_get(secondary_gradient)
local s_r, s_g, s_b, s_a = ui_get(side_arrows_clr)
local b_r, b_g, b_b, b_a = ui_get(on_peek_arrows_clr)
local r, g, b, a = ui_get(indicator_info_clr)
local desync_strength = math.floor(math.min(58, math.abs(entity_get_prop(entity_get_local_player(), "m_flPoseParameter", 11)*120-60)))

-- Desync bar

if ui.get(desync_line) then
-- Desync bar
renderer.gradient(w / 2 - desync_strength, h / 2 + 65, desync_strength, 1, a_r, a_g, a_b, a_a, p_r, p_g, p_b, p_a, true)
renderer.gradient(w / 2, h / 2 + 65, desync_strength, 1, p_r, p_g, p_b, p_a, a_r, a_g, a_b, 30, true)



--

renderer.text(w / 2, h / 2 + 58, 242,213,50,255, "cb", 0, "R O Y A W °")
end



--
if ui_get(side_arrows) then
if ui_get(indicator_arrow) == "simple arrow" then
if not ui_get(manual_aa) or ui_get(manual_state) == 0 then
if brute.best_angle ~= 0 or brute.indexed_angle ~= 0 then
if ui_get(ref_bodyyawadd) == 170 then
	renderer.text(w / 2 + 50, h / 2, 255, 255, 255, 255, "cb", 0, "❱")   --->
	renderer.text(w / 2 - 50, h / 2, s_r, s_g, s_b, s_a, "cb", 0, "❰")     ---<
else
	renderer.text(w / 2 + 50, h / 2, s_r, s_g, s_b, s_a, "cb", 0, "❱")   --->
	renderer.text(w / 2 - 50, h / 2, 255, 255, 255, 255, "cb", 0, "❰")     ---<
end
if ui.get(on_peek_arrows) and  brute.yaw_status == "RESET:L" then
	renderer.text(w / 2 - 50, h / 2, b_r, b_g, b_b, b_a, "cb", 0, "❰")     --- <
elseif ui.get(on_peek_arrows) and  brute.yaw_status == "RESET:R" then
	renderer.text(w / 2 + 50, h / 2, b_r, b_g, b_b, b_a, "cb", 0, "❱")     --- >

end
end
end
end
if ui_get(indicator_arrow) == "OT like" then
if not ui_get(manual_aa) or ui_get(manual_state) == 0 then
if brute.best_angle ~= 0 or brute.indexed_angle ~= 0 then
if ui_get(ref_bodyyawadd) == 170 then
	renderer.text(w / 2 + 50, h / 2, 255, 255, 255, 255, "cb", 0, "▷")
	renderer.text(w / 2 - 50, h / 2, s_r, s_g, s_b, s_a, "cb", 0, "◁")
else
	renderer.text(w / 2 + 50, h / 2, s_r, s_g, s_b, s_a, "cb", 0, "▷")
	renderer.text(w / 2 - 50, h / 2, 255, 255, 255, 255, "cb", 0, "◁")
end
if ui.get(on_peek_arrows) and  brute.yaw_status == "RESET:L" then
	renderer.text(w / 2 - 50, h / 2, b_r, b_g, b_b, b_a, "cb", 0, "◁")
elseif ui.get(on_peek_arrows) and  brute.yaw_status == "RESET:R" then
	renderer.text(w / 2 + 50, h / 2, b_r, b_g, b_b, b_a, "cb", 0, "▷")

end
end
end
end
if ui_get(indicator_arrow) == "Moderen" then
if not ui_get(manual_aa) or ui_get(manual_state) == 0 then
if brute.best_angle ~= 0 or brute.indexed_angle ~= 0 then
if ui_get(ref_bodyyawadd) == 170 then
	renderer.text(w / 2 + 50, h / 2, 255, 255, 255, 255, "cb", 0, "⮚")
	renderer.text(w / 2 - 50, h / 2, s_r, s_g, s_b, s_a, "cb", 0, "⮘")
else
	renderer.text(w / 2 + 50, h / 2, s_r, s_g, s_b, s_a, "cb", 0, "⮚")
	renderer.text(w / 2 - 50, h / 2, 255, 255, 255, 255, "cb", 0, "⮘")
end
if  ui.get(on_peek_arrows) and brute.yaw_status == "RESET:L" then
	renderer.text(w / 2 - 50, h / 2, b_r, b_g, b_b, b_a, "cb", 0, "⮘")
elseif ui.get(on_peek_arrows) and brute.yaw_status == "RESET:R" then
	renderer.text(w / 2 + 50, h / 2, b_r, b_g, b_b, b_a, "cb", 0, "⮚")

end
end
end
end
end


local h_index = 0
if ui.get(indicator_type)== "Default" then

if includes(ui_get(indicators), "Doubletap") and ui_get(ref_dt_key) and ui_get(ref_dt) then
if doubletap_charged() then
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a, "c", 0, string.format("DT"))
else
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), 255, 0, 0, 255, "c", 0, "DT")
end
h_index = h_index + 1
end

if includes(ui_get(indicators), "Min damage") then
renderer.text(w / 2 - 0, h / 2 + 78 + (h_index * 12), r, g, b, a, "c", 0, string.format('DMG:' ..ui.get(mindmg)))
h_index = h_index + 1
end

if includes(ui_get(indicators), "Fakeduck") and ui_get(ref_fd) then
local duck_amt = entity_get_prop(entity_get_local_player(), "m_flDuckAmount")
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a - duck_amt * 155, "c", 0, "DUCK")
h_index = h_index + 1
end

if includes(ui_get(indicators), "Force safepoint") and ui_get(ref_sp_key) then
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a, "c", 0, "SAFE")
h_index = h_index + 1
end

if includes(ui_get(indicators), "Hideshots") and ui_get(ref_hs) and ui_get(ref_hs_key) then
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a, "c", 0, "HIDE")
h_index = h_index + 1
end

if includes(ui.get(indicators), "Force body aim") and ui.get(ref_baim_key) then
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a, "c", 0, "BAIM")
h_index = h_index + 1
end
if includes(ui.get(indicators) , "Hide skeet default" ) then
for i = 1, 50 do
renderer.indicator(0, 0, 0, 0, "Z")
end
end
end
if ui.get(indicator_type)== "Bold" then

if includes(ui_get(indicators), "Doubletap") and ui_get(ref_dt_key) and ui_get(ref_dt) then
if doubletap_charged() then
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a, "cb", 0, string.format("DT"))

else
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), 255, 0, 0, 255, "cb", 0, "DT")
end
h_index = h_index + 1
end

if includes(ui_get(indicators), "Min damage") then
renderer.text(w / 2 , h / 2 + 78 + (h_index * 12), r, g, b, a, "cb", 0, string.format('DMG:' ..ui.get(mindmg)))
h_index = h_index + 1
end


if includes(ui_get(indicators), "Fakeduck") and ui_get(ref_fd) then
local duck_amt = entity_get_prop(entity_get_local_player(), "m_flDuckAmount")
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a - duck_amt * 178, "cb", 0, "DUCK")
h_index = h_index + 1
end

if includes(ui_get(indicators), "Force safepoint") and ui_get(ref_sp_key) then
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a, "cb", 0, "SAFE")
h_index = h_index + 1
end

if includes(ui_get(indicators), "Hideshots") and ui_get(ref_hs) and ui_get(ref_hs_key) then
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a, "cb", 0, "HIDE")
h_index = h_index + 1
end

if includes(ui.get(indicators), "Force body aim") and ui.get(ref_baim_key) then
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a, "cb", 0, "BAIM")
h_index = h_index + 1
end
if includes(ui.get(indicators) , "Hide skeet default" ) then
for i = 1, 50 do
renderer.indicator(0, 0, 0, 0, "Z")
end
end
end
if ui.get(indicator_type)== "Small" then

if includes(ui_get(indicators), "Doubletap") and ui_get(ref_dt_key) and ui_get(ref_dt) then
if doubletap_charged() then
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a, "c-", 0, string.format("DT"))

else
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), 255, 0, 0, 255, "c-", 0, "DT")
end
h_index = h_index + 1
end

if includes(ui_get(indicators), "Min damage") then
renderer.text(w / 2 - 10, h / 2 + 78 + (h_index * 12), r, g, b, a, "c-", 0, string.format('DMG:' ))
renderer.text(w / 2 + 10, h / 2 + 78 + (h_index * 12), r, g, b, a, "cb", 0, string.format(ui.get(mindmg)))
h_index = h_index + 1
end


if includes(ui_get(indicators), "Fakeduck") and ui_get(ref_fd) then
local duck_amt = entity_get_prop(entity_get_local_player(), "m_flDuckAmount")
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a - duck_amt * 178, "c-", 0, "DUCK")
h_index = h_index + 1
end

if includes(ui_get(indicators), "Force safepoint") and ui_get(ref_sp_key) then
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a, "c-", 0, "SAFE")
h_index = h_index + 1
end

if includes(ui_get(indicators), "Hideshots") and ui_get(ref_hs) and ui_get(ref_hs_key) then
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a, "c-", 0, "HIDE")
h_index = h_index + 1
end

if includes(ui.get(indicators), "Force body aim") and ui.get(ref_baim_key) then
renderer.text(w / 2, h / 2 + 78 + (h_index * 12), r, g, b, a, "c-", 0, "BAIM")
h_index = h_index + 1
end
if includes(ui.get(indicators) , "Hide skeet default" ) then
for i = 1, 50 do
renderer.indicator(0, 0, 0, 0, "Z")
end
end
end
end

client.set_event_callback("setup_command", function(cmd)
choked_ticks = cmd.chokedcommands/2 > 2 and cmd.chokedcommands or 0
end)



brute.impact = function(e)
if not ui_get(override_antiaim) then return end

local me = entity_get_local_player()

-- Since bullet_impact gets triggered even while we're dead having this check is a good idea.
if not entity_is_alive(me) then return end

local shooter_id = e.userid
local shooter = client_userid_to_entindex(shooter_id)

-- Distance calculations can sometimes bug when the entity is dormant hence the 2nd check.
if not entity_is_enemy(shooter) or entity_is_dormant(shooter) then return end

local lx, ly, lz = entity_hitbox_position(me, "head_0")

local ox, oy, oz = entity_get_prop(me, "m_vecOrigin")
local ex, ey, ez = entity_get_prop(shooter, "m_vecOrigin")

local dist = ((e.y - ey)*lx - (e.x - ex)*ly + e.x*ey - e.y*ex) / math.sqrt((e.y-ey)^2 + (e.x - ex)^2)

-- 32 is our miss detection radius and the 2nd check is to avoid adding more than 1 miss for a singular bullet (bullet_impact gets called mulitple times per shot).
if math.abs(dist) <= 32 and globals_curtime() - brute.last_miss > 0.015 then
brute.last_miss = globals_curtime()
if brute.misses[shooter] == nil then
brute.misses[shooter] = 1
elseif brute.misses[shooter] >= 2 then
brute.misses[shooter] = nil
else
brute.misses[shooter] = brute.misses[shooter] + 1
end
end
end
--
local ping, pinghotkey, pingslider = ui.reference("Misc", "Miscellaneous", "Ping spike")


client.set_event_callback("run_command", function(c)
if ui.get(backtrack) then
local local_player = entity.get_local_player()
if local_player ~= nil then
local weapon = entity.get_player_weapon(local_player)
local item = entity.get_prop(weapon, "m_iItemDefinitionIndex")
if item ~= nil then
if(item == 40 or item == 9 ) then -- scar20
ui.set(ping, true)
ui.set(pingslider, 100)
ui.set(pinghotkey, "Always On")
else
ui.set(ping, false)
ui.set(pingslider, 1)
ui.set(pinghotkey, "On hotkey")
end
end
end
end
end)

--
local legs_ref = ui.reference("AA", "OTHER", "leg movement")
fakelag = ui.reference("AA", "Fake lag", "Limit")
client.set_event_callback("net_update_end", function()
local state_anims = ui.get(enable_lua)
if state_anims and contains(ui.get(aa_legs), "Break leg animation") then
entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 0)
end
end)

ground_ticks, end_time = 1, 0

client.set_event_callback("pre_render", function()
if contains(ui.get(aa_legs), "Static legs in air") and ui.get(enable_lua) then
entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 6)
end

if contains(ui.get(aa_legs), "Static legs in air") and ui.get(enable_lua) then
local flags = entity.get_prop(entity.get_local_player(), "m_fFlags")
local on_ground = flags ~= 256

if on_ground == 1 then
ground_ticks = ground_ticks + 1
else
ground_ticks = 0
end_time = globals.curtime() + 1
end

if ground_ticks > ui.get(fakelag)+1 and end_time > globals.curtime() then
entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0.5, 12)
end
end
end)

local function legfucker()
if contains(ui.get(aa_legs), "Break leg animation") then
local p = client.random_int(1, 3)
if p == 1 then
ui.set(legs_ref, "Off")
elseif p == 2 then
ui.set(legs_ref, "Always slide")
elseif p == 3 then
ui.set(legs_ref, "Off")
end
end
end
client.set_event_callback('paint', legfucker)




local end_choke_cycle = 0
local function fakelag()
if not ui_get(adaptive_fakelag) then return end

if best_enemy == nil or ui_get(ref_fd) then
ui_set(ref_fl_amt, "Dynamic")
ui_set(ref_fl_limit, 14)
ui_set(ref_fl_var, 0)
ui_set(ref_fl, true)
return
elseif end_choke_cycle == 1 then
ui_set(ref_fl_limit, 1)
ui_set(ref_fl, false)
end_choke_cycle = 2
return
else
ui_set(ref_fl, true)
end

local local_pos = vec_3(client_eye_position())
local extrap_pos = vec_3(extrapolate_position(local_pos.x, local_pos.y, local_pos.z, 14, entity_get_local_player()))

local player_pos = vec_3(entity_hitbox_position(best_enemy, 0))
local player_pos_2 = vec_3(entity_hitbox_position(best_enemy, 4))
local player_pos_3 = vec_3(entity_hitbox_position(best_enemy, 2))

if trace_positions(player_pos.x, player_pos.y, player_pos.z, player_pos_2.x, player_pos_2.y, player_pos_2.z, player_pos_3.x, player_pos_3.y, player_pos_3.z, extrap_pos.x, extrap_pos.y, extrap_pos.z) then
if end_choke_cycle ~= 2 then
end_choke_cycle = 1
else
ui_set(ref_fl_amt, "Maximum")
ui_set(ref_fl_limit, 14)
ui_set(ref_fl_var, math.random(5,20))
end
else
end_choke_cycle = 0

local x, y = entity_get_prop( entity_get_local_player(), 'm_vecVelocity')
local speed = x ~= nil and math.floor(math.sqrt( x * x + y * y + 0.5 )) or 0

ui_set(ref_fl_amt, "Dynamic")
ui_set(ref_fl_limit, 14)
ui_set(ref_fl_var, math.random(25,40))
end
end

brute.reset = function()
brute.indexed_angle = 0
brute.last_miss = 0
brute.best_angle = 0
brute.misses = { }
end



brute.death = function(e)
if not ui_get(override_antiaim) then return end

local victim_id = e.userid
local victim = client_userid_to_entindex(victim_id)

if victim ~= entity_get_local_player() then return end

local attacker_id = e.attacker
local attacker = client_userid_to_entindex(attacker_id)

if not entity_is_enemy(attacker) then return end

if not e.headshot then return end

if brute.misses[attacker] == nil or (globals_curtime() - brute.last_miss < 0.06 and brute.misses[attacker] == 1) then
if brute.hit_reverse[attacker] == nil then
brute.hit_reverse[attacker] = true
else
brute.hit_reverse[attacker] = nil
end
end
end

local function legit_aa(e)
if ui_get(legit_aa_use) and e.in_use == 1 then
if entity_get_classname(entity_get_player_weapon(entity_get_local_player())) == "CC4" then return end

if e.in_attack == 1 then
e.in_use = 1
end

if e.chokedcommands == 0 then
e.in_use = 0
end
end
end

local string_meta = getmetatable('')

function string_meta:__index( key )
local val = string[ key ]
if ( val ) then
return val
elseif ( tonumber( key ) ) then
return self:sub( key, key )
end
end

local function main()
-- Our main function where we do our base authentication and event callbacks.


client_set_event_callback("paint", function()
if not ui_get(enable_lua) then return end

draw()
manual_aa_paint()
end)

client_set_event_callback("run_command", function()
if not ui_get(enable_lua) then return end

get_best_enemy()
get_best_angle()
manual_aa_sc()
anti_aim()
fakelag()
end)

client_set_event_callback("setup_command", function(e)
if not ui_get(enable_lua) then return end
legit_aa(e)
end)

client_set_event_callback("bullet_impact", function(e)
if not ui_get(enable_lua) then return end

brute.impact(e)
end)

client_set_event_callback("player_death", function(e)
if not ui_get(enable_lua) then return end

brute.death(e)
end)

client_set_event_callback("round_start", function()
if not ui_get(enable_lua) then return end

dt_latency = client.latency() * 1000
brute.reset()
end)

client_set_event_callback("client_disconnect", function()
if not ui_get(enable_lua) then return end

brute.reset()
end)

client_set_event_callback("game_newmap", function()
if not ui_get(enable_lua) then return end

brute.reset()
end)

client_set_event_callback("cs_game_disconnected", function()
if not ui_get(enable_lua) then return end

brute.reset()
end)

end
main()
function set_visible_on_elements()
ui.set_visible (enabled_1 , not ui.get (enable_lua))
ui.set_visible(ref_pitch, not ui.get(enable_lua))
ui.set_visible(ref_yaw, not ui.get(enable_lua))
ui.set_visible(ref_yaw_base, not ui.get(aa_legs))
ui.set_visible(ref_yawadd, not ui.get(enable_lua))
ui.set_visible(ref_yawj, not ui.get(enable_lua))
ui.set_visible(ref_yawjadd, not ui.get(enable_lua))
ui.set_visible(ref_bodyyawadd, not ui.get(enable_lua))
ui.set_visible(ref_bodyyaw, not ui.get(enable_lua))
ui.set_visible(ref_fakelimit, not ui.get(enable_lua))
ui.set_visible (ref_fs , not ui.get(enable_lua))
ui.set_visible (ref_fs_key , not ui.get(enable_lua))
ui.set_visible (ref_fs_bodyyaw , not ui.get(enable_lua))
ui.set_visible (edge_yaw , not ui.get(enable_lua))
ui.set_visible(label4, ui.get(enable_lua))
ui.set_visible(label5, ui.get(enable_lua))
ui.set_visible(desync_line, ui.get(enable_lua))
ui.set_visible(primary_gradient, ui.get(enable_lua))
ui.set_visible(secondary_gradient, ui.get(enable_lua))
ui.set_visible(change_aa_on_key, ui.get(enable_lua))
ui.set_visible(override_antiaim, ui.get(enable_lua))
ui.set_visible(adaptive_fakelag, ui.get(enable_lua))
ui.set_visible(adaptive_fs, ui.get(enable_lua))
ui.set_visible(indicator_info_clr, ui.get(enable_lua))
ui.set_visible(manual_aa, ui.get(enable_lua))
ui.set_visible(manual_aa_clr, ui.get(enable_lua))
ui.set_visible(legit_aa_use, ui.get(enable_lua))
ui.set_visible(side_arrows, ui.get(enable_lua))
ui.set_visible(side_arrows_clr, ui.get(enable_lua))
ui.set_visible(indicator_arrow, ui.get(enable_lua))
ui.set_visible(indicator_type, ui.get(enable_lua))
ui.set_visible(indicators, ui.get(enable_lua))
ui.set_visible(backtrack, ui.get(enable_lua))
ui.set_visible(on_peek_arrows, ui.get(enable_lua))
ui.set_visible(on_peek_arrows_clr, ui.get(enable_lua))
ui.set_visible(aa_legs, ui.get(enable_lua))
ui.set_visible(legit_aa_rebind, ui.get(enable_lua))
ui.set_visible(edge_key , ui.get (enable_lua))


end

client.set_event_callback("paint_menu", set_visible_on_elements)
client.set_event_callback("paint", set_visible_on_elements)
