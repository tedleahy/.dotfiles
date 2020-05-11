ln -sf ~/.dotfiles/config/* ~/.config/
rm -rf ~/.config/home_folder
ln -sf ~/.dotfiles/home_folder/.* ~/
ln -sf ~/.dotfiles/scripts ~/.scripts

# Install commonly used programs
sudo apt install bc guake tldr ranger xbacklight htop blueman unclutter snapd code transset-df i3lockmore-git polybar

# Install st 
mkdir ~/util
cd ~/util || exit
git clone git@github.com:tedleahy/st.git
cd st || exit
sudo make install

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install zsh-autosuggestions
git clone "https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

