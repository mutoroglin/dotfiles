-- mutoroglin's hyprland.conf
-- written with love

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")
-- source = $XDG_RUNTIME_DIR/hyprland_color*.conf
--require("$XDG_RUNTIME_DIR/hyprland_color*.conf")


------------------
---- MONITORS ----
------------------
-- # eDP-1:    Dell Latitude E7270 screen, ThinkPad X1 Yoga Gen 5 screen
-- # HDMI-A-1: Acer projector screen
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080",
    position = "0x0",
    scale    = "1",
})
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080",
    position = "0x-1080",
    scale    = "1",
})


-----------------------
---- LUA VARIABLES ----
-----------------------
local ACTIVE_BORDER = {
    colors = {
        "rgba(ff0000ff)",
        "rgba(ff8000ff)"
    },
    angle = 90
}
local INACTIVE_BORDER = {
    colors = {
        "rgba(ffffff88)",
        "rgba(aaaaaaaa)"
    },
    angle = 25
}


-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/local/bin/init_gsettings.sh")
    hl.exec_cmd("hyprctl setcursor XCursor-Pro-Red 24")
    hl.exec_cmd("bluetoothctl power off")
    hl.exec_cmd("hyprwatch.sh > /var/tmp/hyprwatch.log &")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GRIM_DEFAULT_DIR", "/home/lee/Pictures/grim")
hl.env("TERM", "xdg-terminal-exec")
hl.env("TERMINAL", "xdg-terminal-exec")



-----------------------
----- PERMISSIONS -----
-----------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


----------------------------
---- WINDOW DECORATIONS ----
----------------------------
hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 2,
        border_size = 2,
        col = {
            --active_border   = { colors = {"rgba(ff0000ff)", "rgba(ff8000ff)"}, angle = 90 },
            active_border   = ACTIVE_BORDER,
            --inactive_border = { colors = {"rgba(ffffff88)", "rgba(aaaaaaaa)"}, angle = 25 },
            inactive_border = INACTIVE_BORDER,
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 3,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 0.8,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

--------------------
---- ANIMATIONS ----
--------------------
-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("myBezier",       { type = "bezier", points = { {0.05, 0.9},  {0.1, 1.05}  } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

-- hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
-- hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
-- hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
-- hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
-- hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
-- hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
-- hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
-- hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
-- hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
-- hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 10, bezier = "default", style = "popin 50%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default", style = "slide" })


-------------------------
---- WINDOW BEHAVIOR ----
-------------------------
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
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        anr_missed_pings        = 2,
    },
})


---------------
---- INPUT ----
---------------
hl.config({
    input = {
        kb_layout  = "de",
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


---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER" -- Sets "Windows" key as main modifier
hl.bind(mainMod .. " + Q", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + A", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + X", hl.dsp.window.kill())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("/usr/local/bin/launch_launcher.sh"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("alacritty"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))
hl.bind(mainMod .. " + F4", hl.dsp.exec_cmd("/usr/local/bin/launch_powerswitch.sh"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("grim -c"))

-- bind = $mainMod_Shift, Tab , cyclenext, prev
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [1-8]
-- Move active window to a workspace with mainMod + SHIFT + [1-8]
for i = 1, 8 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- binde =, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle; launch_panel.sh volume
-- binde =, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-; launch_panel.sh volume
-- binde =, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+; launch_panel.sh volume
-- binde =, XF86MonBrightnessUp, exec, brightnessctl -c backlight s 5%+; launch_panel.sh brightness
-- binde =, XF86MonBrightnessDown, exec, brightnessctl -c backlight s 5%-; launch_panel.sh brightness
-- binde =, XF86AudioMicMute, exec, pactl set-source-mute 0 toggle; launch_panel.sh mic
-- Laptop multimedia keys for volume and LCD brightness
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


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
--------- COMMON RULES ---------
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

-- # ## all xwayland windows have orange border
-- windowrule = match:xwayland 1, border_color rgba(ff8000ff) rgba(aaaaaaaa)
hl.window_rule({
    name = "xwayland-orange-border",
    match = {
        xwayland = true,
    },
    border_color = { colors = {"rgba(ff8000ff)", "rgba(aaaaaaaa)"} },
})
-- # ## all floating windwows have white border
-- windowrule = match:float 1, border_color rgba(ddddddff) rgba(aaaaaaaa)
hl.window_rule({
    name = "floating-white-border",
    match = {
        float = true,
    },
    border_color = { colors = {"rgba(ddddddff)", "rgba(aaaaaaaa)"} },
})

--------- APPLICATION RULES ---------
-- # ## Galculator
hl.window_rule({ name = "galculator", match = { class = "^(galculator)$", },
    float = true, size = { 800, 400 }, center = true,})

-- # ## Remmina
hl.window_rule({ name = "remmina",  match = { title = "^(Remmina Remote Desktop Client)$", },
    float = true, size = { 800, 400 }, center = true,})

-- # ## blueman (bluetooth agent)
hl.window_rule({ name = "blueman-manager", match = { class = "^(blueman-manager)$", },
    float = true, size = { 400, 800 }, move = { 300, 42 }})
hl.window_rule({ name = "blueman-sendto", match = { class = "^(blueman-sendto)$", },
    float = true})
--hl.window_rule({ name = "blueman-services", match = { class = "^(blueman-services)$", },
--    float = true, size = { 800, 500 }, center = true,})

-- # ## iwgtk
hl.window_rule({ name = "iwgt", match = { class = "org.twosheds.iwgtk", },
    float = true, move = { 200, 42},})

-- # ## Nextcloud
hl.window_rule({ name = "nextcloud", match = { class = "^(com.nextcloud.desktopclient.nextcloud)$", },
    float = true, size = { 500, 800 }, move = { 300, 42 },})

-- # ## pwvucontrol (sound control)
hl.window_rule({ name = "pwvucontrol", match = { class = "^(com.saivert.pwvucontrol)$", },
    float = true, size = { 800, 400 }, center = true,})

-- # ##    Thunar
-- windowrule = match:class ^([Tt]hunar)$, match:title ^(.*Progress)$, float on, center on, size 800 100
hl.window_rule({ match = { class = "^([Tt]hunar)$", title = "^(.*Progress)$", },
    float = true, size = { 800, 100 }, center = true,})
-- windowrule = match:class ^([Tt]hunar)$, match:title ^(Confirm.*)$, float on, center on, size 800 100
hl.window_rule({ match = { class = "^([Tt]hunar)$", title = "^(Confirm.*)$", },
    float = true, size = { 800, 100 }, center = true,})
-- windowrule = match:class ^([Tt]hunar)$, match:title ^(Rename.*)$, float on, center on, size 800 100
hl.window_rule({ match = { class = "^([Tt]hunar)$", title = "^(Rename.*)$", },
    float = true, size = { 800, 100 }, center = true,})

-- # ## LibreOffice
-- windowrule = match:class ^(soffice)$, float on
hl.window_rule({
    match = {
        class = "^(soffice)$",
    },
    float = true,
})

-- # ## x-sane
-- windowrule = match:class ^(Xsane)$, match:title ^(xsane End User License Agreement)$, float on
hl.window_rule({
    match = {
        class = "^(Xsane)$",
        title = "^(xsane End User License Agreement)$",
    },
    float = true,
})

-- windowrule = match:class ^(Xsane)$, match:title ^(Warning)$, float on
hl.window_rule({
    match = {
        class = "^(Xsane)$",
        title = "^(Warning)$",
    },
    float = true,
})

-- # ## authentication
-- windowrule = match:class ^(org.kde.polkit-kde-authentication-agent-1)$, float on
hl.window_rule({
    match = {
        class = "^(org.kde.polkit-kde-authentication-agent-1)$",
    },
    float = true,
})

-- # ## Firefox
-- windowrule = match:class ^(firefox)$, match:title ^(Library)$, float on
hl.window_rule({
    match = {
        class = "^(firefox)$",
        title = "^(Library)$",
    },
    float = true,
})

-- # ## Thunderbird
-- windowrule = match:class ^(thunderbird)$, float on
hl.window_rule({
    match = {
        class = "^(thunderbird)$",
    },
    float = true,
})

-- windowrule = match:class ^(thunderbird)$, match:title ^.*(Mozilla Thunderbird)$, tile on
hl.window_rule({
    match = {
        class = "^(thunderbird)$",
        title = "^.*(Mozilla Thunderbird)$",
    },
    float = true,
})

-- # ## inkscape
-- #windowrulev2 = float, class:^(org.inkscape.Inkscape)$
-- #windowrulev2 = tile, class:^(org.inkscape.Inkscape)$, title:^.*(- Inkscape)$
-- # ## gimp
-- #windowrule = match:initialclass ^(Gimp.*)$, match:float, no-dim on
-- windowrule = match:class ^(file-jpeg)$, float on
hl.window_rule({
    match = {
        class = "^(file-jpeg)$",
    },
    float = true,
})

-- windowrule = match:class ^(file-png)$, float on, size 1000 550, center on
hl.window_rule({
    match = {
        class = "^(file-png)$",
    },
    float = true,
})

-- windowrule = match:class ^(file-pdf-export)$, match:title ^(Export Image as PDF)$, float on
hl.window_rule({
    match = {
        class = "^(file-pdf-export)$",
        title = "^(Export Image as PDF)$",
    },
    float = true,
})

-- # ## vlc
-- #windowrulev2 = nodim, initialClass:^(vlc)$, floating:1
-- # ## mount_stuff.sh
-- #windowrule = match:title ^(Alacritty)$, float on

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})



--------- LAYER RULES ---------
-- layerrule = blur on, match:namespace wofi
-- layerrule = dim_around on, match:namespace wofi
hl.layer_rule({
    name  = "blur-wofi",
    match = { namespace = "wofi" },

    blur = true,
    dim_around = true,
})



-- # ##################
-- # ## HYPR CONFIG ###
-- # ##################

-- $ACTIVE_BORDER = rgba(ff0000ff) rgba(ff8000ff) 90deg
-- $INACTIVE_BORDER = rgba(ffffff88) rgba(aaaaaaaa) 25deg

-- debug {
--     disable_logs = false
-- }
