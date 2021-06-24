# Install yay
if ! command -v yay &> /dev/null; then
	sudo pacman -S --noconfirm --needed git base-devel
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	rm -rf yay
fi

# Install programs
yay -Syyu
yay -S --needed i3-gaps polybar alacritty rofi neovim vim zsh blueman feh picom unclutter-patched pavucontrol pamixer tmux ranger zathura zathura-pdf-poppler i3lockmore-git spotify playerctl transset-df nodenv nodenv-node-build plenv tldr lsd

# Link config files
rm -rf ~/.config/ranger
ln -sf ~/.dotfiles/config/* ~/.config/
ln -sf ~/.dotfiles/config/home_folder/.* ~/
rm -rf ~/.config/home_folder
ln -s ~/.dotfiles/scripts/ ~/.scripts

# Oh My Zsh!
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
