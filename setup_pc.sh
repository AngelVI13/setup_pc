# Update system
sudo dnf -y update
sudo dnf -y upgrade

# Install vim, rg, fzf and other tools. The vim-enhanced package does not come with clipboard support
# so we need to install the alternative vim-X11 package
sudo dnf install -y vim-X11 ripgrep fzf bat

# Install python tools globally
sudo dnf install -y python3-black python3-flake8 python3-isort python3-mypy python3-ipython python3-ipdb

# Add more tooling stuff here

# Vim config setup
cd ~
# Remove any preexisting vimrc directory
sudo rm -rf vimrc
# Clone vim config repo
git clone https://github.com/AngelVI13/vimrc.git 
# Add global vimrc that links to the config from the git repo
cp vimrc/.vimrc_top_level .vimrc
