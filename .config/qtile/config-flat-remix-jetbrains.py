## 
##  ██████╗ ████████╗██╗██╗     ███████╗
## ██╔═══██╗╚══██╔══╝██║██║     ██╔════╝
## ██║   ██║   ██║   ██║██║     █████╗  
## ██║▄▄ ██║   ██║   ██║██║     ██╔══╝  
## ╚██████╔╝   ██║   ██║███████╗███████╗
##  ╚══▀▀═╝    ╚═╝   ╚═╝╚══════╝╚══════╝
##

## Copyright (C) 2020-2024 Aditya Shakya <adi1090x@gmail.com>
## Rewritten by erne.d.98 2025
## 


## ┬┌┬┐┌─┐┌─┐┬─┐┌┬┐
## ││││├─┘│ │├┬┘ │ 
## ┴┴ ┴┴  └─┘┴└─ ┴ 

## Keys
from libqtile.config import Key, KeyChord
from libqtile.lazy import lazy

## Mouse
from libqtile.config import Click, Drag

## Groups
from libqtile.config import Group, Match

## Layouts
from libqtile import layout

## Screens
from libqtile.config import Screen
from libqtile import bar, widget

## ScratchPad and DropDown
from libqtile.config import ScratchPad, DropDown

## Wayland
from libqtile.backend.wayland import InputConfig

## Startup
import os
import subprocess
from libqtile import hook

## ┌─┐┌┬┐┌─┐┬─┐┌┬┐┬ ┬┌─┐
## └─┐ │ ├─┤├┬┘ │ │ │├─┘
## └─┘ ┴ ┴ ┴┴└─ ┴ └─┘┴  

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

## ┬┌─┌─┐┬ ┬┌┐ ┬┌┐┌┌┬┐┬┌┐┌┌─┐┌─┐
## ├┴┐├┤ └┬┘├┴┐││││ │││││││ ┬└─┐
## ┴ ┴└─┘ ┴ └─┘┴┘└┘─┴┘┴┘└┘└─┘└─┘

# default variables
mod          = "mod4"                                                               # modkey: super
home         = os.path.expanduser('~')                                              # relative path
term         = 'kitty'                                                              # terminal launch
term_class   = 'kitty --class'                                                      # terminal launch wm_class
web          = 'qutebrowser'                                                        # web browser
rofi         = 'rofi -terminal kitty -show'                                         # app launcher
bright       = home + '/.config/qtile/scripts/brightness '                          # brightness script
vol          = 'amixer set Master '                                                 # system volume
screenshot   = home + '/.config/qtile/scripts/screenshot '                          # screenshot script
notify_cmd   = 'dunstify -u low -h string:x-dunst-stack-tag:qtileconfig'


keys = [
	## terminal and CLI apps
    Key([mod], "Return", lazy.spawn(term)),                                         # terminal
    Key([mod], "e", lazy.spawn(term + ' ranger')),                                  # file manager
    Key([mod], "h", lazy.spawn(term + ' htop')),                                    # system monitor
    Key([mod], "m", lazy.spawn(term_class + ' audio ncmpcpp')),                     # local music player
    Key([mod, "shift"], "m", lazy.spawn(term_class + ' audio spotify_player')),     # spotify
    Key([mod], "p", lazy.spawn(term + ' pulsemixer')),                              # volume control
    Key([mod, "shift"], "w", lazy.spawn(term_class + ' web newsboat -r')),          # RSS reader

    ## GUI apps
    Key([mod, "shift"], "b", lazy.spawn(web)),                                      # web browser
    Key([mod, "shift"], "g", lazy.spawn('gimp')),                                   # image editor

    ## other utilities
    Key([mod], "space", lazy.spawn(rofi + ' drun')),                                # app launcher
    Key([mod, "shift"], "space", lazy.spawn(rofi + ' run')),                        # run command
    Key([mod], "l", lazy.spawn('betterlockscreen -l blur')),                        # lock screen
    Key([mod], "x", lazy.spawn(home + '/Scripts/btwos-power')),                     # power menu
	
    ## fn keys
    #  brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn(bright + 'plus')),                    # brightness up
    Key([], "XF86MonBrightnessDown", lazy.spawn(bright + 'minus')),                 # brightness down

	#  volume
    Key([], "XF86AudioRaiseVolume", lazy.spawn(vol + '5%+')),                       # volume up
    Key([], "XF86AudioLowerVolume", lazy.spawn(vol + '5%-')),                       # volume down
    Key([], "XF86AudioMute", lazy.spawn(vol + 'toggle')),                           # mute

	#  screenshots 
    Key([], "Print", lazy.spawn(screenshot + '--screen')),                          # take screenshot
    Key(["shift"], "Print", lazy.spawn(screenshot + '--window')),                   # take window screenshot
    Key(["mod1"], "Print", lazy.spawn(screenshot + '--area')),                      # take area screenshot

	## qtile specific
    #  window control
    Key([mod], "q", lazy.window.kill()),                                            # close the window
    Key([mod, "shift"], "q", lazy.window.kill()),                                   # kill the window

	#  control qtile
    Key([mod, "control"], "r", lazy.reload_config()),                               # reload the config
    Key([mod, "control"], "s", lazy.restart()),                                     # restart the wm
    Key([mod, "control"], "q", lazy.shutdown()),                                    # exit the wm

    #  switch focus between windows
    Key([mod], "Left", lazy.layout.left()),                                         # focus the window left
    Key([mod], "Right", lazy.layout.right()),                                       # focus the window right
    Key([mod], "Down", lazy.layout.down()),                                         # focus the window down
    Key([mod], "Up", lazy.layout.up()),                                             # focus the window up

    #  move windows on the current workspace
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left()),                        # move the window left
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right()),                      # move the window right
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),                        # move the window down
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),                            # move the window up

    #  grow and shrink windows
    Key([mod, "control"], "Left", lazy.layout.grow_left()),                         # grow the window left
    Key([mod, "control"], "Right", lazy.layout.grow_right()),                       # grow the window right
    Key([mod, "control"], "Down", lazy.layout.grow_down()),                         # grow the window right
    Key([mod, "control"], "Up", lazy.layout.grow_up()),                             # grow the window up
    Key([mod, "control"], "Return", lazy.layout.normalize()),                       # normalize the window sizes

	#  toggle floating and fullscreen
    Key([mod], "s", lazy.window.toggle_floating()),                                 # floating mode
    Key([mod], "f", lazy.window.toggle_fullscreen()),                               # fullscreen mode

	#  go to next/prev workspace
    Key([mod, "mod1"], "Right", lazy.screen.next_group()),                          # move to the next workspace
    Key([mod, "mod1"], "Left", lazy.screen.prev_group()),                           # move to the previous workspace

    #  back-n-forth workspaces
    Key([mod], "b", lazy.screen.toggle_group()),                                    # move to previously selected workspace

	#  change focus to other window
    Key([mod], "Tab", lazy.layout.next()),                                          # switch to the next window 
    Key([mod, "shift"], "Tab", lazy.layout.prev()),                                 # switch to the prev window 

    #  switch layouts
    Key([mod], "comma", lazy.prev_layout()),                                        # switch to the next layout
    Key([mod], "period", lazy.next_layout()),                                       # switch to the next layout

	#  change the window ratio
    Key([mod], "equal", lazy.layout.grow()),                                        # increase master window size
    Key([mod], "minus", lazy.layout.shrink()),                                      # decrease master window size

    #  toggle between split and unsplit sides of stack
    Key([mod, "shift"], "s", lazy.layout.toggle_split()),

    #  modes: resize
    KeyChord([mod, "shift"], "r", [
        Key([], "Left", lazy.layout.grow_left()),
        Key([], "Right", lazy.layout.grow_right()),
        Key([], "Down", lazy.layout.grow_down()),
        Key([], "Up", lazy.layout.grow_up())],
        mode=True,
        name="Resize"
    ),

    #  modes: layouts
    KeyChord([mod, "shift"], "l", [
        Key([], "Left", lazy.prev_layout()),
        Key([], "Right", lazy.next_layout())],
        mode=True,
        name="Layouts"
    )

]


## ┌┬┐┌─┐┬ ┬┌─┐┌─┐  ┌┐ ┬┌┐┌┌┬┐┬┌┐┌┌─┐┌─┐
## ││││ ││ │└─┐├┤   ├┴┐││││ │││││││ ┬└─┐
## ┴ ┴└─┘└─┘└─┘└─┘  └─┘┴┘└┘─┴┘┴┘└┘└─┘└─┘

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

## ┬ ┬┌─┐┬─┐┬┌─┌─┐┌─┐┌─┐┌─┐┌─┐┌─┐
## ││││ │├┬┘├┴┐└─┐├─┘├─┤│  ├┤ └─┐
## └┴┘└─┘┴└─┴ ┴└─┘┴  ┴ ┴└─┘└─┘└─┘
## a.k.a. groups

groups = [
        Group("1", label="1", layout="monadtall"),
        Group("2", label="2", layout="max", matches=[Match(wm_class="qutebrowser"), Match(wm_class="web"), Match(wm_class="librewolf"), Match(wm_class="firefox")]),
        Group("3", label="3", layout="max", matches=[Match(wm_class="Gimp"), Match(wm_class="feh"), Match(wm_class="imv")]), 
        Group("4", label="4", layout="monadtall", matches=[Match(wm_class="audio")]), 
        Group("5", label="5", layout="monadtall", matches=[Match(wm_class="Zathura")]),
        ]

# keybinds to switch to certain workspaces

for i in groups:
    keys.extend(
        [
            # mod + number of group = switch to group
            Key(
                [mod], i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + number of group = switch to & move focused window to group
            Key(
                [mod, "shift"], i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

## ┬  ┌─┐┬ ┬┌─┐┬ ┬┌┬┐┌─┐
## │  ├─┤└┬┘│ ││ │ │ └─┐
## ┴─┘┴ ┴ ┴ └─┘└─┘ ┴ └─┘

# variables
var_bg_color = '#0d0d0d'
var_active_bg_color = '#ffffff'
var_active_fg_color = '#0d0d0d'
var_inactive_bg_color = '#0d0d0d'
var_inactive_fg_color = '#ffffff'
var_urgent_bg_color = '#ec0101'
var_urgent_fg_color = '#ffffff'
var_section_fg_color = '#ff8a18'
var_active_color = '#ffffff'
var_normal_color = '#0d0d0d'
var_border_width = 3
var_margin = [6,6,6,6]
var_gap_top = 5
var_gap_bottom = 5
var_gap_left = 5
var_gap_right = 5
var_font_name = 'JetBrainsMono Nerd Font'

layouts = [
	# maximized layout – just one window taking the whole screen area
    layout.Max(
		border_focus=var_active_color,
		border_normal=var_normal_color,
		border_width=var_border_width,    
		margin=6
    ),

	# master and stack layout – one big window on the side, several smaller on the other side of the screen
    layout.MonadTall(
		align=0,
		border_focus=var_active_color,
		border_normal=var_normal_color,
		border_width=var_border_width,
		change_ratio=0.05,
		change_size=5,
		margin=6,
		max_ratio=0.75,
		min_ratio=0.25,
		min_secondary_size=85,
		new_client_position='after_current',
		ratio=0.5,
		single_border_width=None,
		single_margin=None
    ),

	# floating layout
    layout.Floating(
		border_focus=var_active_color,
		border_normal=var_normal_color,
		border_width=var_border_width,
		fullscreen_border_width=0,
		max_border_width=0
	)
]

## ┌─┐┌─┐┌┐┌┌─┐┬  ┌─┐
## ├─┘├─┤│││├┤ │  └─┐
## ┴  ┴ ┴┘└┘└─┘┴─┘└─┘
## a.k.a. screens

# default Qtile Bar

screens = [
    Screen(
        top=bar.Bar(
            [
                # workspace indicator
                widget.GroupBox(fontsize=15, 
                                padding_x=10, 
                                center_aligned=True,
                                highlight_method='block', 
                                highlight='ffffff', 
                                block_border='ffffff', 
                                highlight_color=['ffffff','ffffff'], 
                                block_highlight_text_color='0d0d0d',
                                foreground='ffffff',
                                this_current_screen_border='ffffff',
                                inactive='424242',
                                active='ffffff',
                                rounded=False
                                ),

                # text separator
                widget.TextBox(text="┃", 
                               foreground='424242'
                               ),
                
                # window name
                widget.WindowName(max_chars=65,
                                  fontsize=15,
                                  foreground='ffffff'
                                  ),

                # spacer
                widget.Spacer(),
                
                # no idea
                widget.Chord(
                    chords_colors={
                        "launch": ("#ec0101", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),

                # layout indicator
                widget.CurrentLayout(fmt='󰖲 {} ',),
                
                # volume
                widget.Volume(device='default', 
                              fmt='󰕾 {} ',
                              check_mute_command='pactl get-sink-mute @DEFAULT_SINK@',
                              check_mute_string='yes',
                              mute_format='0%',
                              max_chars=5,
                              foreground='ffffff',
                              fontsize=15
                              ),
                
                # network
                widget.Net(fmt='󰛳 {} ',
                           format='{interface}',
                           interface='wlan0',
                           disconnected_message='off',
                           foreground='ffffff',
                           fontsize=15
                           ),
                
                # battery
                widget.Battery(battery='BAT0',
                               charge_char='󰗶',
                               discharge_char='󰋑',
                               empty_char='󰝙',
                               empty_short_text='󰝙 0% ',
                               format='{char} {percent:2.0%} ',
                               full_char='󰋑',
                               full_short_text='󰋑 100% ',
                               low_foreground='ec0101',
                               low_percentage=0.25,
                               not_charging_char='󰋑',
                               unknown_char='󰋔',
                               foreground='ffffff',
                               fontsize=15
                               ),
                
                # clock
                widget.Clock(fontsize=15, 
                             foreground='ffffff',
                             format="󰃮 %d/%m %H:%M %p"
                             ),
            ],
            32,
            background=["0d0d0d", "101010"],
            reserve=True,
            margin=[0,0,0,0],
            opacity=1.0,
            border_width=[0, 0, 0, 0],
            border_color=["000000", "000000", "000000", "000000"]
        ),
    ),
]


# Any third-party statusbar (polybar) with Gaps
"""
screens = [
    Screen(
        right=bar.Gap(var_gap_right),
        left=bar.Gap(var_gap_left),
        bottom=bar.Gap(var_gap_bottom),
        top=bar.Gap(var_gap_top)
    )
]
"""

## ┌┬┐┬┌─┐┌─┐
## ││││└─┐│  
## ┴ ┴┴└─┘└─┘

# let the window be automatically fullscreen 
auto_fullscreen = True

# when clicked, should the window be brought to the front or not (if this is set to "floating_only", only floating windows will get affected)
bring_front_click = False

# the cursor follows the focus as directed by the keyboard, warping to the center of the focused window
cursor_warp = False

# a list of Rule objects which can send windows to various groups based on matching criteria
dgroups_app_rules = []  # type: list

# The default floating layout to use. This allows you to set custom floating rules among other things if you wish.
floating_layout = layout.Floating(
	border_focus=var_active_color,
	border_normal=var_normal_color,
	border_width=var_border_width,
    float_rules=[
        # based on xprop
        *layout.Floating.default_float_rules,
        Match(wm_class="alacritty-float"),
        Match(wm_class="kitty-float"),
        Match(wm_class="Music"),
        Match(wm_class="Lxappearance"),
        Match(wm_class="Nitrogen"),
        Match(wm_class="Pavucontrol"),
        Match(wm_class="Xfce4-power-manager-settings"),
        Match(wm_class="Nm-connection-editor"),
        Match(wm_class="feh"),
        Match(wm_class="Viewnior"),
        Match(wm_class="Gpicview"),
        Match(wm_class="MPlayer"),
        Match(wm_class="Kvantum Manager"),
        Match(wm_class="qt5ct"),
        Match(wm_class="qt6ct"),
        Match(wm_class="VirtualBox Manager"),
        Match(wm_class="qemu"),
        Match(wm_class="Qemu-system-x86_64"),
        Match(title="branchdialog"),
    ]
)

# behavior of the _NET_ACTIVATE_WINDOW message sent by applications
#
# urgent: urgent flag is set for the window
# focus: automatically focus the window
# smart: automatically focus if the window is in the current group
# never: never automatically focus any window that requests it
focus_on_window_activation = "focus"

# focuses windows on mouse hovers
follow_mouse_focus = False

# default settings for bar widgets
widget_defaults = dict(
    font=var_font_name,
    fontsize=15,
    padding=5,
)

# same as `widget_defaults`, default settings for extensions
extension_defaults = widget_defaults.copy()

# controls whether or not to automatically reconfigure screens when there are changes in randr output configuration
reconfigure_screens = True

# if things like steam games want to auto-minimize themselves when losing focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

## ┬ ┬┌─┐┬ ┬┬  ┌─┐┌┐┌┌┬┐
## │││├─┤└┬┘│  ├─┤│││ ││
## └┴┘┴ ┴ ┴ ┴─┘┴ ┴┘└┘─┴┘

# when using wayland, this can be used to configure input devices
wl_input_rules = {
        "type:keyboard": InputConfig(kb_layout="XKB_DEFAUT_LAYOUT", kb_variant="XKB_DEFAULT_VARIANT"),
        "type:touchpad": InputConfig(tap=True, natural_scroll=True)
        }
