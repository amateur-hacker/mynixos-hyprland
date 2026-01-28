{ ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";
      add_newline = true;
      palette = "catppuccin_mocha";
      format = ''
        $directory\
        $git_branch\
        $git_state\
        $git_status\
        $git_metrics\
        $line_break\
        $character
      '';
      line_break = { disabled = false; };
      fill = { symbol = " "; };
      username = {
        disabled = false;
        show_always = true;
        style_user = "bold red";
        format = "[$user]($style)";
      };
      hostname = {
        disabled = false;
        ssh_only = false;
        ssh_symbol = " ";
        style = "bold white";
        trim_at = ".";
        format = "@[$hostname]($style) ";
      };
      directory = {
        style = "blue";
        read_only = " 󰌾";
        truncation_length = 1;
        truncate_to_repo = false;
        fish_style_pwd_dir_length = 1;
        format = "[$path]($style)[$read_only]($read_only_style) ";
      };
      character = {
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
        vicmd_symbol = "[❮](green)";
      };
      git_branch = {
        symbol = " ";
        style = "overlay0";
        format = "[$symbol$branch]($style) ";
      };
      git_status = {
        style = "teal";
        format = "([\\[$all_status$ahead_behind\\]]($style) )";
      };
      git_state = {
        style = "overlay0";
        format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
      };
      git_metrics = { disabled = false; };
      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
    };
  };
}

