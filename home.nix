{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    btop = "btop";
    dunst = "dunst";
    fastfetch = "fastfetch";
    fish = "fish";
    htop = "htop";
    hypr = "hypr";
    kitty = "kitty";
    lazydocker = "lazydocker";
    lazygit = "lazygit";
    lsd = "lsd";
    nvim = "nvim";
    rofi = "rofi";
    starship = "starship";
    Thunar = "Thunar";
    waybar = "waybar";
    wlogout = "wlogout";
    xfce4 = "xfce4";
    yazi = "yazi";
    zathura = "zathura";
    "brave-flags.conf" = "brave-flags.conf";
    "user-dirs.dirs" = "user-dirs.dirs";
  };
in {
  imports = [ ./modules/theme.nix ];

  home.username = "amateur_hacker";
  home.homeDirectory = "/home/amateur_hacker";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    btop
    dunst
    fastfetch
    # fish
    htop
    # hypr
    # hyprlock
    # hypridle
    waypaper
    kitty
    lazydocker
    lazygit
    lsd
    neovim
    rofi
    starship
    swww
    ungoogled-chromium
    wlogout
    ripgrep-all
    nil
    nixpkgs-fmt
    nodejs
    gcc
    nitch
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        (nix-search-tv.overrideAttrs { env.GOEXPERIMENT = "jsonv2"; })
      ];
      text = ''exec "${pkgs.nix-search-tv.src}/nixpkgs.sh" "$@"'';
    })
  ];

  home.file.".face".source = "${config.home.homeDirectory}/.face";

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

}
