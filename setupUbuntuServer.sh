#!/usr/bin/bash
# Installs stuff to Ubuntu.

sudo add-apt-repository universe
sudo apt install tmux zsh curl git software-properties-common ranger
git config --global user.email "jake850@gmail.com"
git config --global user.name "Jared Sackett"
read -p "Install neovim ppa? [Y/n]" yn
yn=${yn:-Y}
case $yn in 
    [Yy]* ) sudo apt-add-repository ppa:neovim-ppa/stable;
            sudo apt update;
            sudo apt install neovim python-dev python-pip python3-dev python3-pip;
            sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60;
            sudo update-alternatives --config vi;
            sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60;
            sudo update-alternatives --config vim;
            sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60;
            sudo update-alternatives --config editor;;
    [Nn]* ) echo "skipping";;
esac
read -p "Install oh-my-zsh? [Y/n]" yn
yn=${yn:-Y}
case $yn in 
	[Yy]* ) sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";;
	[Nn]* ) echo "skipping";;
	* ) echo "Please answer y or n";;
esac
cd ~
read -p "Install neovim plugin manager? [Y/n]" yn
yn=${yn:-Y}
case $yn in 
	[Yy]* ) curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;;
	[Nn]* ) echo "skipping";;
	* ) echo "Please answer y or n";;
esac
read -p "Install Jared's Dotfiles? [Y/n]" yn
yn=${yn:-Y}
case $yn in 
	[Yy]* ) git clone https://github.com/Sacmanxman2/dotfiles.git ~/dotfiles;
		sudo echo 'source ~/dotfiles/tmux' > ~/.tmux.conf;
		sudo echo 'source ~/dotfiles/zshrc' > ~/.zshrc;
		sudo echo 'source ~/dotfiles/vimrc' > ~/.vimrc;
		sudo mkdir ~/.config/nvim
		sudo echo 'source ~/dotfiles/nvimrc' > ~/.config/nvim/init.vim;;
	[Nn]* ) echo "skipping";;
	* ) echo "Please answer y or n";;
esac
read -p "Install neovim plugins? [Y/n]" yn
yn=${yn:-Y}
case $yn in
	[Yy]* ) pip2 install --user neovim;
            pip3 install --user neovim;
            nvim +PlugInstall;;
	[Nn]* ) echo "skipping";;
	* ) echo "Please answer y or n";;
esac
