{ config, pkgs, inputs, ... }:

{
  environment.sessionVariables = { };

  environment.sessionVariables = {
    # Default applications
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "kitty";
    BROWSER = "brave";

    # XDG base directories
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_CACHE_HOME = "$HOME/.cache";

    # User directories
    XDG_DOCUMENTS_DIR = "$HOME/documents";
    XDG_DOWNLOADS_DIR = "$HOME/downloads";
    XDG_MUSIC_DIR = "$HOME/music";
    XDG_PICTURES_DIR = "$HOME/pictures";
    XDG_SCREENSHOTS_DIR = "$XDG_PICTURES_DIR/screenshots";
    XDG_VIDEOS_DIR = "$HOME/videos";

    # Tool XDG paths
    LESSHISTFILE = "$XDG_DATA_HOME/less_history";
    PYTHON_HISTORY = "$XDG_DATA_HOME/python/history";
    XINITRC = "$XDG_CONFIG_HOME/x11/xinitrc";
    XPROFILE = "$XDG_CONFIG_HOME/x11/xprofile";
    XRESOURCES = "$XDG_CONFIG_HOME/x11/xresources";
    GTK2_RC_FILES = "$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0";
    WGETRC = "$XDG_CONFIG_HOME/wget/wgetrc";
    PYTHONSTARTUP = "$XDG_CONFIG_HOME/python/pythonrc";
    GNUPGHOME = "$XDG_DATA_HOME/gnupg";
    CARGO_HOME = "$XDG_DATA_HOME/cargo";
    GOPATH = "$XDG_DATA_HOME/go";
    GOBIN = "$GOPATH/bin";
    GOMODCACHE = "$XDG_CACHE_HOME/go/mod";
    NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/npmrc";
    GRADLE_USER_HOME = "$XDG_DATA_HOME/gradle";
    NUGET_PACKAGES = "$XDG_CACHE_HOME/NuGetPackages";
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java";
    PARALLEL_HOME = "$XDG_CONFIG_HOME/parallel";
    FFMPEG_DATADIR = "$XDG_CONFIG_HOME/ffmpeg";
    WINEPREFIX = "$XDG_DATA_HOME/wineprefixes/default";
    ZDOTDIR = "$XDG_CONFIG_HOME/zsh";
    REDISCLI_RCFILE = "$XDG_CONFIG_HOME/redis/redisclirc";
    REDISCLI_HISTFILE = "$XDG_DATA_HOME/redis/rediscli_history";
    W3M_DIR = "$XDG_STATE_HOME/w3m";
    GIT_CONFIG_GLOBAL = "$XDG_CONFIG_HOME/git/config";
    STARSHIP_CONFIG = "$XDG_CONFIG_HOME/starship/starship.toml";
    ATAC_MAIN_DIR = "$XDG_DATA_HOME/share/atac";

    # Fix Java GUIs on tiling WMs
    _JAVA_AWT_WM_NONREPARENTING = "1";

    # Node
    NODE_OPTIONS = "--no-warnings --max-old-space-size=4096";

    # Locale configuration
    LC_ALL = "en_US.UTF-8";

    # Tools
    MANPAGER = "nvim +Man!";
    BAT_THEME = "catppuccin-mocha";

    # FZF configuration
    FZF_DEFAULT_OPTS =
      "\n    --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \n    --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \n    --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \n    --color=selected-bg:#45475A \n    --color=border:#313244,label:#CDD6F4 \n    --exact --border --cycle --height 40% --reverse";

    # Runtime / Wayland
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland,x11";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
}
