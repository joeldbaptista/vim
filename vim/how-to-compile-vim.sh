
# Requirements
sudo apt install libx11-dev libxtst-dev libxt-dev python3-dev libncurses5-dev gcc make
sudo dnf install -y ncurses-devel python3-devel xclip xsel gcc make

git clone https://github.com/vim/vim.git
cd vim

./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-cscope \
            --prefix=/usr/local \
            --without-x \
            --disable-gui

