local vars = require("variable")

hl.bind(vars.mainMod .. " + R", hl.dsp.exec_cmd("tofi-drun --drun-launch=true"))
hl.bind(vars.mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(vars.mainMod .. " + L", hl.dsp.exec_cmd("wlogout -p layer-shell -b 6 -L 150 -R 150 -B 300 -T 300 -c 40,"))
hl.bind("code:107", hl.dsp.exec_cmd('hyprshade off && grim -t png -l0 -g "$(slurp)" - | swappy -f - && hyprshade on grayscale'))
hl.bind(vars.mainMod .. " + K", hl.dsp.exec_cmd("hyprpicker -a -n -r -f hex"))
hl.bind(vars.mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | tofi | cliphist decode | wl-copy"))
hl.bind(vars.mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(vars.mainMod .. " + return", hl.dsp.exec_cmd(vars.terminal))
local closeWindowBind = hl.bind(vars.mainMod .. " + W", hl.dsp.window.close())

-- closeWindowBind:set_enabled(false)
hl.bind(vars.mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(vars.mainMod .. " + E", hl.dsp.exec_cmd(vars.fileManager))
hl.bind(vars.mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(vars.mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(vars.mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Mouse

hl.bind(vars.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(vars.mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(vars.mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(vars.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move focus with mainMod + arrow keys
hl.bind(vars.mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(vars.mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(vars.mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(vars.mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(vars.mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(vars.mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(vars.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(vars.mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(vars.mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(vars.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })



-- Extras
-- hl.bind(vars.mainMod .. " + R", hl.dsp.exec_cmd(vars.menu))

-- Example special workspace (scratchpad)
-- hl.bind(vars.mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
-- hl.bind(vars.mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
