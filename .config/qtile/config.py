
from libqtile import bar, layout
from libqtile.config import EzClick as Click
from libqtile.config import EzDrag as Drag
from libqtile.config import Match, Screen
from libqtile.lazy import lazy
from qtile_extras import widget  # type: ignore

from groups import groups  # NOQA
from hooks import hook  # NOQA
from keys import keys  # NOQA

layout_theme = {
    "margin": 0,
    "border_width": 1,
    "border_focus": "#42fff9",
    "border_normal": "#000000",
}

layouts = [
    layout.Tile(**layout_theme),
    layout.Columns(**layout_theme),
    # layout.Max(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = {
    "font": "Inter",
    "fontsize": 12,
    "padding": 3,
}

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(highlight_method="block"),
                widget.Prompt(),
                widget.WindowName(),
                widget.Mpd2(),
                widget.Volume(),
                widget.Clock(format="%a %Y-%m-%d %H:%M:%S", timezone="Europe/Budapest"),
                widget.StatusNotifier(),
            ],
            24,
            background="#222222",
            # Draw top and bottom borders
            # border_width=[2, 0, 2, 0],
            # Borders are magenta
            # border_color=['ff00ff', '000000', 'ff00ff', '000000']
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag("M-1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag("M-3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click("M-2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    **layout_theme,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(wm_class=r"steam_app_[0-9]*"),  # any steam apps
        Match(wm_class=r"Minecraft\*.* "),  # minecraft
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(title=r"osu\!.*"),  # osu!
    ]
)
auto_fullscreen = True
auto_minimize = True
focus_on_window_activation = "focus"
reconfigure_screens = True

wmname = "qtile"
