{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-a";
    mouse = true;
    
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      cpu
      resurrect
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor 'mocha'
          set -g @catppuccin_window_status_style "rounded"
        '';
      }
    ];

    extraConfig = ''
      # Copy mode bindings
      bind-key -T copy-mode    Space send-keys -X begin-selection
      bind-key -T copy-mode-vi Enter send-keys -X copy-selection-and-cancel
      bind-key -T copy-mode    Enter send-keys -X copy-selection-and-cancel
      bind c new-window -c "#{pane_current_path}"

      # Clipboard support
      set -g set-clipboard on
      set -g xterm-keys on

      # Theme Customization
      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_application}"
      set -agF status-right "#{E:@catppuccin_status_cpu}"
      set -ag status-right "#{E:@catppuccin_status_session}"
      set -ag status-right "#{E:@catppuccin_status_uptime}"
    '';
  };

  home.packages = with pkgs; [
    git
  ];
}