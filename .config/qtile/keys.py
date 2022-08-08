from libqtile.config import EzKey as Key
from libqtile.lazy import lazy

from groups import groups

browser = "firefox"
editor = "geany"
filemanager = "thunar"
terminal = "kitty"

keys = [
    # Switch between windows
    Key("M-h", lazy.layout.left()),
    Key("M-l", lazy.layout.right()),
    Key("M-j", lazy.layout.down()),
    Key("M-k", lazy.layout.up()),
    Key("M-<Tab>", lazy.layout.next()),
    # Move windows between left/right columns or move up/down in current stack.
    Key("M-S-h", lazy.layout.shuffle_left()),
    Key("M-S-l", lazy.layout.shuffle_right()),
    Key("M-S-j", lazy.layout.shuffle_down()),
    Key("M-S-k", lazy.layout.shuffle_up()),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key("M-C-h", lazy.layout.grow_left()),
    Key("M-C-l", lazy.layout.grow_right()),
    Key("M-C-j", lazy.layout.grow_down()),
    Key("M-C-k", lazy.layout.grow_up()),
    Key("M-n", lazy.layout.normalize()),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key("M-S-<Return>", lazy.layout.toggle_split()),
    # Un/Minimize windows with Qminimize
    Key("M-S-m", lazy.spawn("Qminimize -u")),
    Key("M-m", lazy.spawn("Qminimize -m")),
    # Applicaion binds
    Key("M-f", lazy.spawn(filemanager)),
    Key("M-<Return>", lazy.spawn(terminal)),
    Key("M-w", lazy.spawn(browser)),
    Key("M-e", lazy.spawn(editor)),
    Key("<Print>", lazy.spawn("flameshot gui")),
    # Audio binds
    Key("<XF86AudioRaiseVolume>", lazy.spawn("amixer sset Master 5%+")),
    Key("<XF86AudioLowerVolume>", lazy.spawn("amixer sset Master 5%-")),
    Key("<XF86AudioMute>", lazy.spawn("amixer sset Master toggle")),
    # MPD binds
    Key("<XF86AudioStop>", lazy.spawn("mpc stop")),
    Key("<XF86AudioPlay>", lazy.spawn("mpc toggle")),
    Key("<XF86AudioPrev>", lazy.spawn("mpc prev")),
    Key("<XF86AudioNext>", lazy.spawn("mpc next")),
    # Toggle between different layouts as defined below
    Key("M-c", lazy.window.kill()),
    Key("M-C-r", lazy.reload_config()),
    Key("M-C-q", lazy.shutdown()),
    Key("M-d", lazy.spawn("rofi -show")),
]

for i in groups:
    keys.extend(
        [
            Key(f"M-{i.name}", lazy.group[i.name].toscreen()),
            Key(f"M-S-{i.name}", lazy.window.togroup(i.name, switch_group=True)),
        ]
    )
