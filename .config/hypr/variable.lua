---------------------
---- MY PROGRAMS ----
---------------------

local M = {}

M.terminal    = "kitty"
M.fileManager = "thunar"
M.menu        = "hyprlauncher"
M.mainMod     = "SUPER"

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 0,
        gaps_out = 0,

        border_size = 1,

        col = {
            active_border   = { colors = {"rgba(d8dee9ff)", "rgba(eceff4ff)"}, angle = 45 },
            inactive_border = "rgba(1a1b26ff)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 3,
        rounding_power = 1,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 5,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "latam",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("myBezier", { type = "bezier", points = { {0.16, 0.85}, {0.2, 1.0} } })

hl.curve("easy", { type = "spring", mass = 1, stiffness = 300, dampening = 26 })

hl.animation({ leaf = "global",        enabled = true, speed = 10,  bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 8,   bezier = "easeOutQuint" })

hl.animation({ leaf = "windows",       enabled = true, speed = 3,   spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 2.5, spring = "easy", style = "popin 95%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.2, bezier = "linear", style = "popin 95%" })

hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.2, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1,   bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 1.5, bezier = "quick" })

hl.animation({ leaf = "layers",        enabled = true, speed = 2.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 2,   bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.2, bezier = "linear", style = "fade" })

hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1,   bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 0.8, bezier = "almostLinear" })

hl.animation({ leaf = "workspaces",    enabled = true, speed = 2, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 2, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2, bezier = "myBezier", style = "slide" })

hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 4,   bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

return M
