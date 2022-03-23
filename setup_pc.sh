# Update system
sudo dnf -y update
sudo dnf -y upgrade

# Install vim, rg, fzf and other tools. The vim-enhanced package does not come with clipboard support
# so we need to install the alternative vim-X11 package
sudo dnf install -y vim-X11 ripgrep fzf bat

# Install python tools globally
sudo dnf install -y python3-black python3-flake8 python3-isort python3-mypy python3-ipython python3-ipdb
echo "export PYTHONBREAKPOINT=ipdb.set_trace" >> .bashrc

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
git config --global credential.helper store

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

<< wily
# Install wily
pushd /tmp

# download wily
curl --header 'Host: deac-ams.dl.sourceforge.net' --user-agent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --referer 'https://sourceforge.net/' --cookie '__cmpconsentx11319=CPVjjLAPVjjLAAfUnBENCFCsAP_AAH_AACiQGgwDwAGgAVABAADQAJgAXwAwgB4AEEAJAAUYBCAFoALzAaCBoMA8ABoAFQAQAA0ACYAF8AMIAeABBACQAFGAQgBaAC8wGggAAA; __cmpcvcx11319=__s23_s135_s24_s30_U__; __cmpcpcx11319=____' --header 'Upgrade-Insecure-Requests: 1' --header 'Sec-Fetch-Dest: document' --header 'Sec-Fetch-Mode: navigate' --header 'Sec-Fetch-Site: same-site' 'https://deac-ams.dl.sourceforge.net/project/wily/baseline/0.13.42/wily-0.13.42.tar.gz' --output 'wily-0.13.42.tar.gz'

# Extract it
mkdir wily
cp wily-0.13.42.tar.gz wily
cd wily
tar -xzf wily-0.13.42.tar.gz
# Install it
./configure
make
sudo make install

# Configure colors
sudo echo "wily*background: #e8ddae" >> /etc/X11/Xresources
sudo echo "wily*foreground: black" >> /etc/X11/Xresources
sudo echo "wily*font:*-fixed-*-*-*-18-*" >> /etc/X11/Xresources

xrdb -merge /etc/X11/Xresources
wily

# Install kakoune
sudo dnf install -y kakoune
# install lsp support
sudo dnf copr enable atim/kakoune -y && sudo dnf install -y kak-lsp
pushd ~/.config
git clone https://github.com/AngelVI13/kakrc.git
mv ./kakrc ./kak
# Install go lsp
# NOTE: I think i can just install this package from dnf but this worked
#       so i will stick with it
go install golang.org/x/tools/gopls@latest
echo 'export PAHT=$PATH:~/go/bin/' >> .bashrc
# Install python lsp
sudo dnf install -y pylsp
popd


# NOTE: run the following command to make a shared folder accessible without su priviledges
# sudo usermod -G vboxsf -a myusername

