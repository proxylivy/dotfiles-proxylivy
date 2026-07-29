local vars = require("variable")

hl.on("hyprland.start", function()

    ------------------------
    ---- SYSTEM / PORTALS ----
    ------------------------

    hl.exec_cmd("sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE")
    hl.exec_cmd("sleep 1 && killall -e xdg-desktop-portal-hyprland & killall -e xdg-desktop-portal-gtk & killall xdg-desktop-portal && /usr/lib/xdg-desktop-portal-hyprland & /usr/lib/xdg-desktop-portal-gtk & /usr/lib/xdg-desktop-portal &")
    hl.exec_cmd("dbus-monitor --session")

    ------------------------
    ---- THEMING / NOTIFICATIONS ----
    ------------------------

    hl.exec_cmd("nwg-look -a")
    hl.exec_cmd("/usr/bin/swaync")
    hl.exec_cmd("/usr/bin/swaync-client --reload-config ; /usr/bin/swaync-client --reload-css")

    ------------------------
    ---- CLIPBOARD ----
    ------------------------

    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    ------------------------
    ---- DAEMONS ----
    ------------------------

    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("playerctld daemon")
    -- hl.exec_cmd("hypridle")
    -- hl.exec_cmd("eww daemon")
    hl.exec_cmd("lf -server")
    hl.exec_cmd("emacs --daemon")

    ------------------------
    ---- WORKSPACES (apps al login) ----
    ------------------------

    -- ⚠️ No confirmado el mecanismo Lua para "[workspace N silent]"
    -- Puede requerir un parámetro extra en exec_cmd o un dispatcher distinto.
    -- Verificar en https://wiki.hypr.land/Configuring/

    hl.exec_cmd("firefox-esr") -- workspace 2 silent
    hl.exec_cmd("sleep 1 && obsidian") -- workspace 1 silent
    hl.exec_cmd("/usr/bin/ferdium --enable-features=WaylandWindowDecorations --ozone-platform-hint=wayland") -- workspace 9 silent

    ------------------------
    ---- WALLPAPERS ----
    ------------------------

    hl.exec_cmd("sleep 0.3 && awww img --transition-duration 1 --transition-step 1 --transition-type none --outputs eDP-1 Camping.png")
    hl.exec_cmd("sleep 0.3 && awww img --transition-duration 1 --transition-step 1 --transition-type none --outputs HDMI-A-1 Opportunity.png")
    hl.exec_cmd("sleep 0.3 && awww img --transition-duration 1 --transition-step 1 --transition-type none --outputs DP-1 relax.png")

    ------------------------
    ---- GRAYSCALE (LEGACY) ----
    ------------------------

    -- ⚠️ Esto era "exec" (se re-ejecuta en cada reload), no "exec-once"
    -- ver nota arriba sobre la diferencia
    hl.exec_cmd("hyprshade on grayscale")

    ------------------------
    ---- POWER ON SOUND ----
    ------------------------

    hl.exec_cmd("sleep 4 && find /home/deathgabox/.local/startup/ -type f | shuf -n 1 | xargs -d \"\\n\" mpv")
end)
