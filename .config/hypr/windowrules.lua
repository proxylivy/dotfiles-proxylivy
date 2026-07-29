--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

------------------------
---- FLOAT ----
------------------------

hl.window_rule({ name = "float-floating-class", match = { class = "floating" }, float = true })
hl.window_rule({ name = "float-imv",             match = { class = "^(imv)$" }, float = true })
hl.window_rule({ name = "float-mpv",             match = { class = "^(mpv)$" }, float = true })
hl.window_rule({ name = "float-blueman",         match = { class = "^(blueman-manager)$" }, float = true })
hl.window_rule({ name = "float-pavucontrol",     match = { class = "^(pavucontrol)$" }, float = true })
hl.window_rule({ name = "float-winetricks",      match = { class = "^(Winetricks)$" }, float = true })
hl.window_rule({ name = "float-zenity",          match = { class = "^(zenity)$" }, float = true })
hl.window_rule({ name = "float-putty",           match = { class = "^(putty)$" }, float = true })
hl.window_rule({ name = "float-gcolor3",         match = { class = "^(gcolor3)$" }, float = true })
hl.window_rule({ name = "float-gcolor3-full",    match = { class = "^(nl.hjdskes.gcolor3)$" }, float = true })
hl.window_rule({ name = "float-xarchiver",       match = { class = "^(xarchiver)$" }, float = true })
hl.window_rule({ name = "float-xdg-portal-gtk",  match = { class = "^(Xdg-desktop-portal-gtk)$" }, float = true })
hl.window_rule({ name = "float-solanum",         match = { class = "^(org.gnome.Solanum)$" }, float = true })

-- Fix Thunar Delete
hl.window_rule({
    name  = "float-thunar-progress",
    match = { class = "^(thunar)$", title = "^(Progreso de las operaciones de archivo)$" },
    float = true,
})
hl.window_rule({
    name  = "float-thunar-rename",
    match = { class = "^(thunar)$", title = "^(Renombrar)(.*)$" },
    float = true,
})

------------------------
---- BORDER SIZE 0 ----
------------------------

hl.window_rule({ name = "noborder-steam",       match = { class = "^(steam)$" }, border_size = 0 })
hl.window_rule({ name = "noborder-obsidian",    match = { class = "^(obsidian)$" }, border_size = 0 })
hl.window_rule({ name = "noborder-firefox-esr", match = { class = "^(firefox-esr)$" }, border_size = 0 })
hl.window_rule({ name = "noborder-chromium",    match = { class = "^(Chromium)$" }, border_size = 0 })
hl.window_rule({ name = "noborder-firefox",     match = { class = "^(firefox)$" }, border_size = 0 })
hl.window_rule({ name = "noborder-firefox-cap", match = { class = "^(Mozilla Firefox)$" }, border_size = 0 })
hl.window_rule({ name = "noborder-zathura",     match = { class = "^(zathura)$" }, border_size = 0 })
hl.window_rule({ name = "noborder-vbox-manager",match = { class = "^(VirtualBox Manager)$" }, border_size = 0 })
hl.window_rule({ name = "noborder-vbox-machine",match = { class = "^(VirtualBox Machine)$" }, border_size = 0 })
hl.window_rule({ name = "noborder-zathura-org", match = { class = "^(org\\.pwmt\\.zathura)$" }, border_size = 0 })
hl.window_rule({ name = "noborder-ferdium",     match = { class = "^(Ferdium)$" }, border_size = 0 })
hl.window_rule({ name = "noborder-thunar",      match = { class = "^(thunar)$" }, border_size = 0 })

------------------------
---- OPACITY Y BLUR ----
------------------------

-- ⚠️ No confirmado si el campo se llama "opacity" con tabla {active, inactive}
-- o son dos campos separados "active_opacity"/"inactive_opacity" como en hl.config general.
-- Dejo la forma más probable según el patrón de hl.config visto en el ejemplo oficial:

------------------------
---- XWAYLANDVIDEOBRIDGE ----
------------------------

-- ⚠️ El "override" en tu conf viejo (opacity 0.0 override 0.0 override) modificaba el
-- comportamiento normal de blending. No confirmado si Lua expone ese flag "override"
-- por separado o si simplemente con active_opacity=0/inactive_opacity=0 basta.

hl.window_rule({ name = "xwaylandvideobridge-noanim",  match = { class = "^(xwaylandvideobridge)$" }, no_anim = true })
hl.window_rule({ name = "xwaylandvideobridge-nofocus", match = { class = "^(xwaylandvideobridge)$" }, no_initial_focus = true })

-- ⚠️ max_size en el conf viejo era "1 1" (ancho alto) — no confirmado el formato Lua exacto,
-- podría ser tabla {1, 1} o dos campos separados.
hl.window_rule({
    name  = "xwaylandvideobridge-maxsize",
    match = { class = "^(xwaylandvideobridge)$" },
    max_size = { 1, 1 },
})

hl.window_rule({ name = "xwaylandvideobridge-noblur", match = { class = "^(xwaylandvideobridge)$" }, no_blur = true })

------------------------
---- SWAYNC (layer rules) ----
------------------------

-- Estaban comentadas en tu conf viejo, las dejo igual comentadas.
-- Nota: layer_rule usa "namespace", visto también en el ejemplo oficial (hl.layer_rule).

-- hl.layer_rule({ name = "swaync-blur",        match = { namespace = "^(.*swaync.*)$" }, blur = true })
-- hl.layer_rule({ name = "swaync-ignorealpha", match = { namespace = "^(.*swaync.*)$" }, ignore_alpha = 0.5 })

------------------------
---- OPACITY Y BLUR ----
------------------------

hl.window_rule({
    name  = "opacity-default",
    match = { class = "^.*$" },
    opacity = "0.92 0.85",
})

hl.window_rule({ name = "opacity-gcolor3",  match = { class = "^(gcolor3)$" },      opacity = "1 1" })
hl.window_rule({ name = "opacity-steam",    match = { class = "^(steam)$" },        opacity = "1 1" })
hl.window_rule({ name = "opacity-gimp",     match = { class = "^(Gimp-2\\.10)$" },  opacity = "1 1" })
hl.window_rule({ name = "opacity-ferdium",  match = { class = "^(ferdium)$" },      opacity = "0.98 0.95" })
hl.window_rule({ name = "opacity-firefox",  match = { class = "^(firefox-esr)$" }, opacity = "0.94 0.88" })
hl.window_rule({ name = "opacity-mpv",      match = { class = "^(mpv)$" },          opacity = "0.95 0.80" })
hl.window_rule({ name = "opacity-obsidian", match = { class = "^(obsidian)$" },     opacity = "0.98 0.94" })
hl.window_rule({ name = "opacity-kitty",    match = { class = "^(kitty)$" },        opacity = "0.86 0.75" })
hl.window_rule({ name = "opacity-thunar",   match = { class = "^(thunar)$" },       opacity = "0.85 0.75" })
hl.window_rule({ name = "opacity-xdgportal",match = { class = "^(Xdg-desktop-portal-gtk)$" }, opacity = "0.85 0.75" })
hl.window_rule({ name = "opacity-electron", match = { class = "^(electron)$" },     opacity = "0.85 0.70" })

hl.window_rule({
    name  = "opacity-firefox-upload",
    match = { class = "^(firefox-esr)$", title = "^(Carga de archivos)$" },
    opacity = "0.85 0.70",
})

------------------------
---- XWAYLANDVIDEOBRIDGE ----
------------------------

hl.window_rule({
    name  = "xwaylandvideobridge-opacity",
    match = { class = "^(xwaylandvideobridge)$" },
    opacity = "0.0 override 0.0 override",
})
