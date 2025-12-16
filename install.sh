ln -sfn $(pwd)/nvim $HOME/.config/nvim
ln -sfn $(pwd)/tmux/tmux.conf $HOME/.tmux.conf
ln -sfn $(pwd)/sway $HOME/.config/sway 
ln -sfn $(pwd)/waybar $HOME/.config/waybar 
ln -sfn $(pwd)/wofi $HOME/.config/wofi
ln -sfn $(pwd)/alacritty $HOME/.config/alacritty
ln -sfn $(pwd)/emacs $HOME/.emacs.d

rm -r /etc/greetd
cp -rf $(pwd)/greetd /etc/greetd
# ln -sfn $(pwd)/configuration.nix  /etc/nixos/configuration.nix
