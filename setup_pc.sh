# Update system
sudo dnf -y update
sudo dnf -y upgrade

# Install vim, rg, fzf and other tools
sudo dnf install -y vim-enhanced ripgrep fzf 

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