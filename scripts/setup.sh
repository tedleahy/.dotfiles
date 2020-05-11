ln -sf ~/.dotfiles/config/* ~/.config/
rm -rf ~/.config/home_folder
ln -sf ~/.dotfiles/home_folder/.* ~/
ln -sf ~/.dotfiles/scripts ~/.scripts

# Install commonly used programs
sudo apt install bc guake tldr ranger xbacklight htop blueman unclutter

# Install st 
sudo apt update
sudo apt install -y libx11.dev libxft-dev
mkdir ~/util
cd ~/util || exit
git clone git@github.com:tedleahy/st.git
cd st || exit
sudo make install

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install snap
sudo apt install -y snapd

# Install VS Code
sudo snap install -y code

# Install zsh-autosuggestions
git clone "https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Install transset-df (for ~/.scripts/flash_win.sh)
cd ~/util || exit
wget https://forchheimer.se/transset-df/transset-df-6.tar.gz
cd transset-df-6 || exit
sudo apt install -y libxcomposite-dev libxdamage1 libxdamage-dev # install dependencies
make
sudo make install 
cd ~/util || exit

# Install Polybar
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/share/pkgconfig
git clone "https://github.com/polybar/polybar.git"
cd polybar || exit
# dependencies
sudo apt install -y build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
./build.sh -f --all-features -j
cd ~/util || exit

# Install i3lockmore
sudo apt install i3lock imagemagick # dependencies
git clone https://github.com/SammysHP/i3lockmore.git
cd i3lockmore || exit
mkdir ~/.local/bin
ln -s ~/util/i3lockmore/i3lockmore ~/.local/bin
