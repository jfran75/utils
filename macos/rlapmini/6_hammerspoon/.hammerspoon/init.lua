require("hs.ipc")

--# constants
local hyper = { "cmd", "alt", "ctrl", "shift" }
-- local hyperWindows = { "ctrl", "alt" }
local super = "⌃⌥"
local superSuper = "⌃⌥"
local empty_table = {}
local windowCornerRadius = 10

--# images
local images = require("images")

-- To swap two windows, you press super + y to engage swapping, then move your focus to another window with the directions, then you hit super + y again to effectively swap those two windows.
local windowAction = require("windowAction")
windowAction.new(super, hs.keycodes.map["y"], "swap", images.swap) --["y"]
windowAction.new(super, hs.keycodes.map["n"], "warp", images.warp) --["n"]
windowAction.new(super, hs.keycodes.map["h"], "stack", images.stack) --["h"]

--# canvas elements
local canvases = {
	winFocusRect = hs.canvas.new({ x = 0, y = 0, w = 100, h = 100 }),
}

local focus_ = {
	--hideTimer = nil
}

--# helpers
function yabai(args, completion)
	local yabai_output = ""
	local yabai_error = ""
	-- Runs in background very fast
	local yabai_task = hs.task.new("/opt/homebrew/bin/yabai", nil, function(task, stdout, stderr)
		--print("stdout:"..stdout, "stderr:"..stderr)
		if stdout ~= nil then
			yabai_output = yabai_output .. stdout
		end
		if stderr ~= nil then
			yabai_error = yabai_error .. stderr
		end
		return true
	end, args)
	if type(completion) == "function" then
		yabai_task:setCallback(function()
			completion(yabai_output, yabai_error)
		end)
	end
	yabai_task:start()
end

function delayed(fn, delay)
	return hs.timer.delayed.new(delay, fn):start()
end

toasts = {
	main = nil,
}
function killToast(params)
	params = params or empty_table
	local name = params.name or "main"
	if toasts[name] ~= nil then
		hs.alert.closeSpecific(toasts[name], params.fadeOutDuration or 0.1)
		toasts[name] = nil
	end
end
function toast(str, time, params)
	killToast(params)
	params = params or empty_table
	local name = params.name or "main"
	--local toast = toasts[name]
	toasts[name] = hs.alert(str, {
		fillColor = { white = 0, alpha = 0.4 },
		strokeColor = { white = 0, alpha = 0 },
		strokeWidth = 0,
		textColor = { white = 1, alpha = 1 },
		radius = 0,
		padding = 6,
		atScreenEdge = 0,
		fadeInDuration = 0.1,
		fadeOutDuration = params.fadeOutDuration or 0.1,
	}, time or 0.6)
end

--# Main chooser
local mainChooser = hs.chooser
	.new(function(option)
		if option ~= nil then
			if option.action == "reload" then
				hs.reload()
			elseif option.action == "toggle_gap" then
				yabai({ "-m", "space", "--toggle", "padding" }, function()
					yabai({ "-m", "space", "--toggle", "gap" })
				end)
			elseif option.action == "k9sdev-services-1-23-eck" then
				k9s("~/.kube/config", "dev-services-1-23", "elastic-system", "elastic")
				k9s("~/.kube/config", "dev-services-1-23", "istio-apps", "istio-apps")
			elseif option.action == "k9sdev" then
				k9s("~/.kube/config", "dev-cluster-1-23", "sfyc", "dev")
			elseif option.action == "k9sqa-1-23" then
				k9s("~/.kube/config", "qa-cluster-1-23", "sfyc", "qa")
			elseif option.action == "k9sprod" then
				k9s("~/.kube/config", "prod-sfyc", "sfyc", "prod")
			elseif option.action == "testk9sprod" then
				k9s("~/.kube/config", "prod-sfyc", "tp-sfyc", "tp-prod")
			elseif option.action == "k9slegacy" then
				k9s("~/.kube/config", "prod-legacy", "sfyc", "legacy")
			elseif option.action == "k9sdev-redis" then
				k9s_statefulsets("~/.kube/config", "dev-cluster-1-23", "redis", "redis")
			elseif option.action == "k9sqa-redis" then
				k9s_statefulsets("~/.kube/config", "qa-cluster-1-23", "redis", "redis")
			elseif option.action == "k9sprod-redis" then
				k9s_statefulsets("~/.kube/config", "prod-sfyc", "redis", "redis")
			end
		end
	end)
	:choices({
		{
			text = "Toggle Gap",
			subText = "Toggles padding and gaps around the current space",
			action = "toggle_gap",
		},
		{
			text = "Reload",
			subText = "Reload Hammerspoon configuration",
			action = "reload",
		},
		{
			text = "k9s development",
			subText = "Send development commands for k9s",
			action = "k9sdev",
		},
		{
			text = "k9s qa",
			subText = "Send QA commands for k9s-1-23",
			action = "k9sqa-1-23",
		},
		{
			text = "k9s PRODUCTION",
			subText = "Send PRODUCTION commands for k9s",
			action = "k9sprod",
		},
		{
			text = "k9s redis development",
			subText = "Send redis commands for k9s",
			action = "k9sdev-redis",
		},
		{
			text = "k9s redis qa",
			subText = "Send redis commands for k9s",
			action = "k9sqa-redis",
		},
		{
			text = "k9s redis PRODUCTION",
			subText = "Send redis commands for k9s",
			action = "k9sprod-redis",
		},
		{
			text = "k9s DEV-QA argocd",
			subText = "Send DEV-QA argocd commands for k9s",
			action = "k9sdev-qa-argocd",
		},
		{
			text = "k9s dev-services-1-23 elastic search",
			subText = "Send dev-services-1-23 commands for k9s",
			action = "k9sdev-services-1-23-eck",
		},
		{
			text = "k9s LEGACY",
			subText = "Send LEGACY commands for k9s",
			action = "k9slegacy",
		},
		{
			text = "Test PRODUCTION",
			subText = "Send commands TP-SFYC for k9s PRODUCTION",
			action = "testk9sprod",
		},
	})

--# bindings

--# reload config
hs.hotkey.bind(hyper, hs.keycodes.map["return"], nil, function()
	hs.reload()
end) --["return"]
--# open main chooser
hs.hotkey.bind(super, hs.keycodes.map["space"], nil, function()
	mainChooser:show()
end) --["space"]

--# set layout under mouse
hs.hotkey.bind(super, hs.keycodes.map["1"], function()
	yabai({ "-m", "space", "mouse", "--layout", "bsp" }, function()
		toast("🖖")
	end)
end) --["1"]
hs.hotkey.bind(super, hs.keycodes.map["2"], function()
	yabai({ "-m", "space", "mouse", "--layout", "stack" }, function()
		toast("📚")
	end)
end) --["2"]
hs.hotkey.bind(super, hs.keycodes.map["3"], function()
	yabai({ "-m", "space", "mouse", "--layout", "float" }, function()
		toast("☁️")
	end)
end) --["3"]

--# rotate space tree
hs.hotkey.bind(super, hs.keycodes.map["."], function()
	yabai({ "-m", "space", "--rotate", "270" }, function()
		toast("🔲🔁")
	end)
end) --["."]

--# focus fullscreen
hs.hotkey.bind(super, hs.keycodes.map["m"], function()
	yabai({ "-m", "window", "--toggle", "zoom-fullscreen" })
end) --["m"]
--hs.hotkey.bind(super, hs.keycodes.map[","], function() yabai({"-m", "window", "--toggle", "zoom-parent"}) end) -- not so useful  --[","]

--# toggle float layout for window
hs.hotkey.bind(super, hs.keycodes.map["/"], function()
	yabai({ "-m", "window", "--toggle", "float" })
	toast("🎚☁️")
end) --["/"]

--# change window stack focus
-- hs.hotkey.bind(super, hs.keycodes.map["t"], function() yabai({"-m", "window", "--focus", "stack.next"}, function() toast("📚↥") end) end)  --["t"]
-- hs.hotkey.bind(super, hs.keycodes.map["g"], function() yabai({"-m", "window", "--focus", "stack.prev"}, function() toast("📚↧") end) end)  --["g"]

--# change window focus to direction
hs.hotkey.bind(super, hs.keycodes.map["l"], function()
	yabai({ "-m", "window", "--focus", "east" })
end) --[";"]
hs.hotkey.bind(super, hs.keycodes.map["h"], function()
	yabai({ "-m", "window", "--focus", "west" })
end) --["j"]
hs.hotkey.bind(super, hs.keycodes.map["k"], function()
	yabai({ "-m", "window", "--focus", "north" })
end) --["l"]
hs.hotkey.bind(super, hs.keycodes.map["j"], function()
	yabai({ "-m", "window", "--focus", "south" })
end) --["k"]

--# bsp ratio
hs.hotkey.bind(super, hs.keycodes.map["7"], function()
	yabai({ "-m", "window", "--ratio", "abs:0.38" })
	toast("🔲⅓")
end) --["7"]
hs.hotkey.bind(super, hs.keycodes.map["8"], function()
	yabai({ "-m", "window", "--ratio", "abs:0.5" })
	toast("🔲½")
end) --["8"]
hs.hotkey.bind(super, hs.keycodes.map["9"], function()
	yabai({ "-m", "window", "--ratio", "abs:0.62" })
	toast("🔲⅔")
end) --["9"]
hs.hotkey.bind(super, hs.keycodes.map["0"], function()
	yabai({ "-m", "space", "--balance" })
	toast("🔲⚖️")
end) --["-"]

-- test move window to space
-- hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, hs.keycodes.map["Left"], nil, )
-- shift + alt - 1 : yabai -m window --space 1; yabai -m space --focus 1
hs.hotkey.bind({ "cmd", "alt" }, hs.keycodes.map["1"], function()
	yabai({ "-m", "window", "--space", "1" })
	yabai({ "-m", "space", "--focus", "1" })
end)
hs.hotkey.bind({ "cmd", "alt" }, hs.keycodes.map["2"], function()
	yabai({ "-m", "window", "--space", "2" })
	yabai({ "-m", "space", "--focus", "2" })
end)
hs.hotkey.bind({ "cmd", "alt" }, hs.keycodes.map["3"], function()
	yabai({ "-m", "window", "--space", "3" })
	yabai({ "-m", "space", "--focus", "3" })
end)
hs.hotkey.bind({ "cmd", "alt" }, hs.keycodes.map["4"], function()
	yabai({ "-m", "window", "--space", "4" })
	yabai({ "-m", "space", "--focus", "4" })
end)
hs.hotkey.bind({ "cmd", "alt" }, hs.keycodes.map["5"], function()
	yabai({ "-m", "window", "--space", "5" })
	yabai({ "-m", "space", "--focus", "5" })
end)
hs.hotkey.bind({ "cmd", "alt" }, hs.keycodes.map["6"], function()
	yabai({ "-m", "window", "--space", "6" })
	yabai({ "-m", "space", "--focus", "6" })
end)
hs.hotkey.bind({ "cmd", "alt" }, hs.keycodes.map["7"], function()
	yabai({ "-m", "window", "--space", "7" })
	yabai({ "-m", "space", "--focus", "7" })
end)
hs.hotkey.bind({ "cmd", "alt" }, hs.keycodes.map["8"], function()
	yabai({ "-m", "window", "--space", "8" })
	yabai({ "-m", "space", "--focus", "8" })
end)
hs.hotkey.bind({ "cmd", "alt" }, hs.keycodes.map["9"], function()
	yabai({ "-m", "window", "--space", "9" })
	yabai({ "-m", "space", "--focus", "9" })
end)

-- send window to monitor and follow focus
hs.hotkey.bind({ "cmd", "alt" }, hs.keycodes.map["n"], function()
	yabai({ "-m", "window", "--display", "next" })
	yabai({ "-m", "display", "--focus", "next" })
end)
hs.hotkey.bind({ "cmd", "alt" }, hs.keycodes.map["p"], function()
	yabai({ "-m", "window", "--display", "previous" })
	yabai({ "-m", "display", "--focus", "previous" })
end)

--# modals
local focus_display_mod = hs.hotkey.modal.new(super, hs.keycodes.map["v"]) --["v"]
local insert_window_modal = hs.hotkey.modal.new(super, hs.keycodes.map["tab"]) --["tab"]
local move_display_modal = hs.hotkey.modal.new(super, hs.keycodes.map["b"]) --["b"]
local resize_window_modal = hs.hotkey.modal.new()

--# focus display
function focus_display_mod:entered()
	toast("🖥🧭", true, { name = "modal" })
end
function focus_display_mod:exited()
	killToast({ name = "modal" })
end
focus_display_mod:bind("", hs.keycodes.map["escape"], function()
	focus_display_mod:exit()
end) --["escape"]
focus_display_mod:bind(super, hs.keycodes.map["h"], function()
	yabai({ "-m", "display", "--focus", "next" }, function()
		delayed(function()
			toast("🖥➡️")
		end, 0.1)
	end)
	focus_display_mod:exit()
end) --[";"]
focus_display_mod:bind(super, hs.keycodes.map["l"], function()
	yabai({ "-m", "display", "--focus", "prev" }, function()
		delayed(function()
			toast("🖥⬅️")
		end, 0.1)
	end)
	focus_display_mod:exit()
end) --["j"]

--# insert window rule
--# insert window rule functions
function insert_window_modal:entered()
	toast("🔲🌱 ", true, { name = "modal" })
end
function insert_window_modal:exited()
	killToast({ name = "modal" })
end
insert_window_modal:bind("", hs.keycodes.map["escape"], function()
	insert_window_modal:exit()
end) --["escape"]
insert_window_modal:bind(super, hs.keycodes.map["l"], function()
	yabai({ "-m", "window", "--insert", "east" })
end) --[";"]
insert_window_modal:bind(super, hs.keycodes.map["h"], function()
	yabai({ "-m", "window", "--insert", "west" })
end) --["j"]
insert_window_modal:bind(super, hs.keycodes.map["k"], function()
	yabai({ "-m", "window", "--insert", "north" })
end) --["l"]
insert_window_modal:bind(super, hs.keycodes.map["j"], function()
	yabai({ "-m", "window", "--insert", "south" })
end) --["k"]
insert_window_modal:bind(super, hs.keycodes.map["i"], function()
	yabai({ "-m", "window", "--insert", "stack" })
end) --["h"]
insert_window_modal:bind(super, hs.keycodes.map["tab"], function()
	insert_window_modal:exit()
	resize_window_modal:enter()
end) --["tab"]

--# send window to display
local move_display_ = {
	selected = nil,
}
function move_display_modal:entered()
	yabai({ "-m", "query", "--windows", "--window" }, function(out)
		local window = hs.json.decode(out)
		if window ~= nil then
			--print(hs.inspect(hs.json.decode(out)))
			move_display_.selected = window
			toast("🔲🖥", true, { name = "move_display" })
		end
	end)
end
function move_display_modal:exited()
	move_display_.selected = nil
	killToast({ name = "move_display" })
end
move_display_modal:bind(
	super,
	hs.keycodes.map["G"], --[";"]
	function()
		if move_display_.selected ~= nil then
			yabai({ "-m", "window", "--display", "next" }, function()
				move_display_modal:exit()
			end)
		end
	end
)
move_display_modal:bind(
	super,
	hs.keycodes.map["H"], --["j"]
	function()
		if move_display_.selected ~= nil then
			yabai({ "-m", "window", "--display", "prev" }, function()
				move_display_modal:exit()
			end)
		end
	end
)
move_display_modal:bind("", hs.keycodes.map["escape"], function()
	move_display_modal:exit()
end) --["escape"]

--# resize window
local resize_window = {
	size = 20,
	horizontalEdge = nil, -- 1 is for right, -1 is for left
	verticalEdge = nil, -- 1 is for bottom, -1 is for top
}
function resize_window_modal:entered()
	toast("🔲↔️", true, { name = "resize_window" })
end
function resize_window_modal:exited()
	resize_window.horizontalEdge = nil
	resize_window.verticalEdge = nil
	killToast({ name = "resize_window" })
end

resize_window_modal:bind(super, hs.keycodes.map["l"], function() --[";"]
	if resize_window.horizontalEdge == nil then
		resize_window.horizontalEdge = 1
	end
	if resize_window.horizontalEdge == 1 then
		-- grow from right
		print("grow from right")
		yabai({ "-m", "window", "--resize", "right:" .. resize_window.size .. ":0" }, function(out, err)
			print(out, err)
		end)
	else
		-- shrink from left
		print("shrink from left")
		yabai({ "-m", "window", "--resize", "left:" .. resize_window.size .. ":0" }, function(out, err)
			print(out, err)
		end)
	end
end)

resize_window_modal:bind(super, hs.keycodes.map["h"], function() --["j"]
	if resize_window.horizontalEdge == nil then
		resize_window.horizontalEdge = -1
	end
	if resize_window.horizontalEdge == 1 then
		-- shrink from right
		print("shrink from right")
		yabai({ "-m", "window", "--resize", "right:-" .. resize_window.size .. ":0" }, function(out, err)
			print(out, err)
		end)
	else
		-- grow from left
		print("grow from left")
		yabai({ "-m", "window", "--resize", "left:-" .. resize_window.size .. ":0" }, function(out, err)
			print(out, err)
		end)
	end
end)

resize_window_modal:bind(super, hs.keycodes.map["j"], function() --["k"]
	if resize_window.verticalEdge == nil then
		resize_window.verticalEdge = 1
	end
	if resize_window.verticalEdge == 1 then
		-- grow from bottom
		print("grow from bottom")
		yabai({ "-m", "window", "--resize", "bottom:0:" .. resize_window.size }, function(out, err)
			print(out, err)
		end)
	else
		-- shrink from top
		print("shrink from top")
		yabai({ "-m", "window", "--resize", "top:0:" .. resize_window.size }, function(out, err)
			print(out, err)
		end)
	end
end)

resize_window_modal:bind(super, hs.keycodes.map["k"], function() --["l"]
	if resize_window.verticalEdge == nil then
		resize_window.verticalEdge = -1
	end
	if resize_window.verticalEdge == 1 then
		-- shrink from bottom
		print("shrink from bottom")
		yabai({ "-m", "window", "--resize", "bottom:0:-" .. resize_window.size }, function(out, err)
			print(out, err)
		end)
	else
		-- grow from top
		print("grow from top")
		yabai({ "-m", "window", "--resize", "top:0:-" .. resize_window.size }, function(out, err)
			print(out, err)
		end)
	end
end)
resize_window_modal:bind("", hs.keycodes.map["escape"], function()
	resize_window_modal:exit()
end) --["escape"]

--# debug
hs.hotkey.bind(super, hs.keycodes.map["§"], function()
	yabai({ "-m", "query", "--windows", "--window" }, function(out)
		print(out)
	end)
	toast("🐞")
end) --["§"]

--# window focus listener
currentFocus = nil
function onWindowFocusChanged(window_id)
	getFocusedWindow(function(win)
		if win ~= nil then
			if currentFocus == nil or currentFocus.id ~= win.id then
				currentFocus = win
				--deleteBorder()
				createBorder(win)
			end
		else
			currentFocus = nil
			deleteBorder()
		end
	end)
end

function onWindowResized(window_id)
	if currentFocus ~= nil and currentFocus.id == window_id then
		getWindow(currentFocus.id, function(win)
			--deleteBorder()
			createBorder(win)
		end)
	end
end

function onWindowMoved(window_id)
	if currentFocus ~= nil and currentFocus.id == window_id then
		getWindow(currentFocus.id, function(win)
			--deleteBorder()
			createBorder(win)
		end)
	end
end

function createBorder(win)
	if win == nil or canvases.winFocusRect == nil then
		return
	end
	canvases.winFocusRect:topLeft({ x = win.frame.x - 2, y = win.frame.y - 2 })
	canvases.winFocusRect:size({ w = win.frame.w + 4, h = win.frame.h + 4 })
	local borderColor = { red = 0.8, green = 0.8, blue = 0.2, alpha = 0.6 }
	local zoomed = win["zoom-fullscreen"] == 1
	if zoomed then
		borderColor = { red = 0.8, green = 0.2, blue = 0.2, alpha = 0.6 }
	end
	canvases.winFocusRect:replaceElements({
		type = "rectangle",
		action = "stroke",
		strokeColor = borderColor,
		strokeWidth = 4,
		--strokeDashPattern = { 60, 40 },
		roundedRectRadii = { xRadius = windowCornerRadius, yRadius = windowCornerRadius },
		padding = 2,
	})
	canvases.winFocusRect:show()
end
function deleteBorder(fadeTime)
	canvases.winFocusRect:hide()
end

--# query
function getFocusedWindow(callback)
	yabai({ "-m", "query", "--windows" }, function(out, err)
		if out == nil or type(out) ~= "string" or string.len(out) == 0 then
			callback(nil)
		else
			out = string.gsub(out, ":inf,", ":0.0,")
			local json = '{"windows":' .. out .. "}"
			--print(json)
			local json_obj = hs.json.decode(json)
			if json_obj ~= nil then
				local windows = json_obj.windows
				for i, win in ipairs(windows) do
					if win.focused == 1 then
						callback(win)
						return
					end
				end
				callback(nil)
			else
				getFocusedWindow(callback)
			end
		end
	end)
end

function getWindow(window_id, callback)
	yabai({ "-m", "query", "--windows", "--window", tostring(window_id) }, function(out, err)
		if out == nil or string.len(out) == 0 then
			callback(nil)
		else
			--print("json|"..out.."|len"..string.len(out))
			local win = hs.json.decode(out)
			callback(win)
		end
	end)
end

--# install cli
hs.ipc.cliInstall()

-- calls made by yabai frow cli, see .yabairc
yabaidirectcall = {
	window_focused = function(window_id) -- called when another window from the current app is focused
		onWindowFocusChanged(window_id)
	end,
	application_activated = function(process_id) -- called when a window from a different app is focused. Doesn’t exclude a window_focused call.
		onWindowFocusChanged(window_id)
	end,
	window_resized = function(window_id) -- called when a window changes dimensions
		onWindowResized(window_id)
	end,
	window_moved = function(window_id) -- called when a window is moved
		onWindowMoved(window_id)
	end,
}

onWindowFocusChanged(nil) -- show borders of focused window at startup

--- start quick open applications
function open_app(name)
	return function()
		hs.application.launchOrFocus(name)
		if name == "Finder" then
			hs.appfinder.appFromName(name):activate()
		end
	end
end

--- quick open applications
-- hs.hotkey.bind({"alt", "shift"}, "C", open_app("Visual Studio Code"))

function OpenKitty()
	local t = hs.task.new("/Applications/kitty.app/Contents/MacOS/kitty", nil, function()
		return true
	end, { "--single-instance", "-d", "~" })
	t:start()
end

-- kitty terminal
hs.hotkey.bind({ "cmd", "alt" }, hs.keycodes.map["return"], function()
	OpenKitty()
end)

function k9s_statefulsets(kubeconfig, context, namespace, prefix)
	local app = hs.application.get("kitty")

	if app == nil then
		hs.application.launchOrFocus("kitty")
		hs.timer.usleep(1000000)
		app = hs.application.get("kitty")
	end

	hs.eventtap.keyStrokes("kitty @ set-tab-title clean", app)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ send-text kubectl config use-context " .. context .. "\\\\x0d\\\\x0d", app)
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	-- hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-events' --keep-focus zsh", app)
	-- hs.eventtap.keyStroke({}, "return", 200000, app)
	-- hs.eventtap.keyStrokes(
	-- 	"kitty @ send-text --match-tab 'title:^"
	-- 		.. prefix
	-- 		.. "-events' k9s --kubeconfig "
	-- 		.. kubeconfig
	-- 		.. " --context "
	-- 		.. context
	-- 		.. " --command events\\\\x0d\\\\x0d",
	-- 	app
	-- )
	-- hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-pods' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-pods' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command pods\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-statefulsets' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-statefulsets' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command statefulsets\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

 	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-secrets' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-secrets' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command secrets\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

end

function k9s(kubeconfig, context, namespace, prefix)
	local app = hs.application.get("kitty")

	if app == nil then
		hs.application.launchOrFocus("kitty")
		hs.timer.usleep(1000000)
		app = hs.application.get("kitty")
	end

	hs.eventtap.keyStrokes("kitty @ set-tab-title clean", app)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ send-text kubectl config use-context " .. context .. "\\\\x0d\\\\x0d", app)
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-events' --keep-focus zsh", app)
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-events' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --command events\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)
  
	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-nodes' --keep-focus zsh", app)
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-nodes' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --command nodes\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-ns' --keep-focus zsh", app)
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-ns' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --command namespaces\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-gw' --keep-focus zsh", app)
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-gw' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command gw\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-pods' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-pods' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command pods\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-deploy' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-deploy' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command deploy\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-vs' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-vs' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command virtualservices\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-hpa' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-hpa' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command hpa\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)
  
	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-dr' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-dr' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command dr\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-configmaps' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-configmaps' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command cm\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-secrets' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-secrets' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command secrets\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-pvclaim' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-pvclaim' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command pvc\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-pv' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-pv' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command pv\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-roles' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-roles' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command roles\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-rolebindings' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-rolebindings' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command rolebindings\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)

	hs.eventtap.keyStrokes("kitty @ launch --type=tab --tab-title '" .. prefix .. "-podsecurity' --keep-focus zsh")
	hs.eventtap.keyStroke({}, "return", 200000, app)
	hs.eventtap.keyStrokes(
		"kitty @ send-text --match-tab 'title:^"
			.. prefix
			.. "-podsecurity' k9s --kubeconfig "
			.. kubeconfig
			.. " --context "
			.. context
			.. " --namespace "
			.. namespace
			.. " --command Podsecuritypolicies\\\\x0d\\\\x0d",
		app
	)
	hs.eventtap.keyStroke({}, "return", 200000, app)


end

-- hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "d", function()
-- 	k9s("~/.kube/config", "dev-cluster", "sfyc", "dev")
-- end)
--
-- hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "q", function()
-- 	k9s("~/.kube/config", "qa-cluster", "sfyc", "qa")
-- end)
--
-- hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "p", function()
-- 	k9s("~/.kube/config", "prod-sfyc", "sfyc", "prod")
-- end)
--
-- hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "l", function()
-- 	k9s("~/.kube/prod-legacy", "prod-legacy", "sfyc", "legacy")
-- end)
--

-- hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "h", function()
--   yabai({ "-m", "space", "--mirror", "y-axis" })
-- end)

hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "h", function()
	yabai({ "-m", "window", "--swap", "prev" })
end)

hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "l", function()
	yabai({ "-m", "window", "--swap", "next" })
end)

hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "j", function()
	yabai({ "-m", "window", "--swap", "south" })
end)

hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "k", function()
	yabai({ "-m", "window", "--swap", "north" })
end)

-- Notify about the config reload
hs.notify.new({ title = "Hammerspoon", informativeText = "Config loaded" }):send()
