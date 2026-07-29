-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

------------------------
---- GTK THEMING ----
------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "BreezeX-Black")
-- hl.env("GTK_THEME", "Nordic") -- Broken GTK Selector, solo usar cuando sea necesario

------------------------
---- XDG ----
------------------------

hl.env("XDG_CONFIG_HOME", os.getenv("HOME") .. "/.config")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_RUNTIME_DIR", "/run/user/1000")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

------------------------
---- EDITOR ----
------------------------

hl.env("EDITOR", "micro")

------------------------
---- QT THEMING ----
------------------------

hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_QPA_PLATFORM", "wayland;x11")
-- hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
-- hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
-- hl.env("QT_STYLE_OVERRIDE", "kvantum")


------------------------
---- EXPERIMENTAL ----
------------------------

-- hl.env("GSK_RENDERER", "ngl")
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")
-- hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
-- hl.env("ANV_VIDEO_DECODE", "1")

------------------------
---- CLUTTER / SDL2 ----
------------------------

-- hl.env("CLUTTER_BACKEND", "wayland")
-- hl.env("SDL_VIDEODRIVER", "wayland")

------------------------
---- FIREFOX WAYLAND ----
------------------------

-- Ref: https://discourse.ubuntu.com/t/environment-variables-for-wayland-hackers/12750
-- hl.env("MOZ_ENABLE_WAYLAND", "1")
-- hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")
-- hl.env("MOZ_DBUS_REMOTE", "1")

-- hl.env("WLR_NO_HARDWARE_CURSORS", "1")

------------------------
---- BACKEND / GAMING ----
------------------------

-- hl.env("GDK_BACKEND", "wayland;x11")
-- hl.env("__GL_MaxFramesAllowed", "1")

------------------------
---- TESTING / NVIDIA ----
------------------------

-- hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
-- hl.env("__NV_PRIME_RENDER_OFFLOAD", "0")
-- hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")
-- hl.env("PROTON_ENABLE_NGX_UPDATER", "1")
-- hl.env("NVD_BACKEND", "direct")
-- hl.env("WLR_DRM_NO_ATOMIC", "1")
-- hl.env("WLR_USE_LIBINPUT", "1")

------------------------
---- X11 LAG ----
------------------------

-- hl.env("CLUTTER_DEFAULT_FPS", "60")
-- hl.env("__GL_SYNC_DISPLAY_DEVICE", "60")
