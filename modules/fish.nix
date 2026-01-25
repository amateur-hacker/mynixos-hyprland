{ config, pkgs, inputs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      # Directory navigation
      ".." = "cd ..";
      ".2" = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";

      # Common command settings
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -vI";
      bc = "bc -ql";
      qalc = "qalc -t";
      mkdir = "mkdir -pv";
      locate = "plocate";
      trm = "trash-put -v";
      tres = "trash-restore";
      tls = "trash-list";
      tclean = "trash-empty";
      grep = "grep --color=always";
      rg = "rg --smart-case --color=always";
      ln = "ln -iv";
      chmod = "chmod -v";
      chown = "chown -v";
      ls = "lsd --icon=always --color=always --group-directories-first";
      ld = "eza -lhD --icons=always --color=always";
      la = "lsd -a --icon=always --color=always --group-directories-first";
      ll = "lsd -l --icon=always --color=always --group-directories-first";
      lla = "lsd -al --icon=always --color=always --group-directories-first";
      lt =
        "lsd -a --tree --icon=always --color=always --group-directories-first";
      "l." = "lsd -d --icon=always --color=always --group-directories-first .*";

      # Better defaults
      cat = "bat";
      man = "batman";

      # Application shortcuts
      v = "nvim";
      sv = "sudoedit";
      za = "zathura";

      # Clean home directory
      wget = ''wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'';

      # Change the default shell
      tobash =
        "chsh $USER -s /bin/bash && echo 'Log out and log back in to apply changes.'";
      tozsh =
        "chsh $USER -s /bin/zsh && echo 'Log out and log back in to apply changes.'";
      tofish =
        "chsh $USER -s /bin/fish && echo 'Log out and log back in to apply changes.'";

      # File permissions
      pxu = "chmod -v u+x"; # user exec only
      pxall = "chmod -v a+x"; # all can execute
      plock = "chmod -Rv u=,g=,o="; # 000
      prwu = "chmod -Rv u=rw,g=r,o=r"; # 644
      prwall = "chmod -Rv a=rw"; # 666
      pxpub = "chmod -Rv u=rwx,g=rx,o=rx"; # 755
      pfull = "chmod -Rv a=rwx"; # 777
      pinfo = "eza --no-time --no-user --no-filesize -l";

      # File owner and groups
      own = "eza -lg --no-time --no-filesize --no-permissions";

      # File Utilities
      ex = "unp"; # Extract any archive(s)
      f = "find . | grep"; # Search files in the cwd

      # Search command line history
      h = "history | grep";

      # Disk info
      diskinfo = "dysk --sort type-desc";

      # System monitoring
      p = "ps aux | grep";
      topcpu = "/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10";

      # System specific
      sysrs = "sudo nixos-rebuild switch";
      sysup = "sudo nixos-rebuild switch --upgrade";
      sysclean = "sudo nix-collect-garbage -d; and sudo nix-store --optimise";
    };

    programs.fish.shellInit = ''
      fish_add_path \
          $HOME/.local/bin \
          $HOME/.local/share/cargo/bin
    '';
    programs.fish.interactiveShellInit = ''
      # FZF configuration
      set -x FZF_DEFAULT_OPTS "\
      --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
      --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
      --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
      --color=selected-bg:#45475A \
      --color=border:#313244,label:#CDD6F4 \
      --exact --border --cycle --height 40% --reverse"

      # LESS colors
      set -x LESS "R --use-color -Dd+r -Du+b"
      set -x LESS_TERMCAP_mb (printf '\e[1;31m')
      set -x LESS_TERMCAP_md (printf '\e[1;36m')
      set -x LESS_TERMCAP_me (printf '\e[0m')
      set -x LESS_TERMCAP_so (printf '\e[01;44;33m')
      set -x LESS_TERMCAP_se (printf '\e[0m')
      set -x LESS_TERMCAP_us (printf '\e[1;32m')
      set -x LESS_TERMCAP_ue (printf '\e[0m')

      # Launch fastfetch
      if status is-interactive
          fastfetch
      end
    '';
    # Vim-style key bindings + HyDE history bindings
    functions = {
      fish_user_key_bindings = ''
        bind yy fish_clipboard_copy
        bind Y fish_clipboard_copy
        bind p fish_clipboard_paste
        bind -M visual -m default y 'fish_clipboard_copy; commandline -f end-selection repaint-mode'
        bind --erase --preset -M visual \ev
        bind --erase --preset -M insert \ev
        bind \eh backward-word
        bind \ej down-line-or-history
        bind \ek up-line-or-history
        bind \el forward-word

        # HyDE: Quick history access with Alt+number (1-9)
        bind_M_n_history
      '';

      # HyDE function: Bind Alt+number to recall history items
      bind_M_n_history = ''
        for i in (seq 9)
          set -l command
          if test (count $history) -ge $i
            set command "commandline -r \$history[$i]"
          else
            set command "echo \"No history found for number $i\""
          end

          if contains fish_vi_key_bindings $fish_key_bindings
            bind -M default \e$i "$command"
            bind -M insert \e$i "$command"
          else
            bind \e$i "$command"
          end
        end
      '';
    };
    # Fish plugins for enhanced functionality
    plugins = [
      # FZF integration for Fish
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      # Auto-complete matching pairs
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      # Notifications when long commands finish
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      # Clean failed commands from history
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
    ];
  };
}
