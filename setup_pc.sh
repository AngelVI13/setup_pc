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
# Make search preview script executable
chmod 777 vimrc/.vim/search_preview.sh

# Add git info
echo "Adding fake git user.email. Please change it: git config --global user.email"
git config --global user.email "angel@gmail.com"
git config --global user.name "Angel VI"

# Install i3
# After installing you have to logout and login with an i3 session
sudo dnf install -y i3 i3status dmenu i3lock xbacklight feh

echo "alias vim=vimx" >> .bashrc

# Activate git's credentials caching
git config --global credential.helper cache

# Install pyenv for managing different python versions
sudo dnf install -y gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel patch
curl https://pyenv.run | bash
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> .bashrc
echo 'eval "$(pyenv init -)"' >> .bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> .bashrc
echo 'if command -v pyenv 1>/dev/null 2>&1; then' >> .bashrc
echo '    eval "$(pyenv init --path)"' >> .bashrc
echo 'fi' >> .bashrc
exec "$SHELL"

# Next steps, install global & local python versions
# pyenv install 3.10.2
# pyenv global 3.10.2
# cd project_folder
# pyenv install 3.7.12
# pyenv local 3.7.12

# NOTE: run the following command to make a shared folder accessible without su priviledges
# sudo usermod -G vboxsf -a myusername
