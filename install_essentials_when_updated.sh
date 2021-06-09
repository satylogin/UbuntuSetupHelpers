# the essential
sudo apt-get update
sudo apt-get upgrade

# get c++ compiler
sudo apt-get install g++

# get git
sudo apt-get install git
git config --global user.name "Satyarth Agrahari"
git config --global user.email "satylogin@gmail.com"

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
exec "$SHELL"

# install python build essentials
sudo apt-get install --no-install-recommends make \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  wget \
  curl \
  llvm \
  libncurses5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev \
  cmake \
  python3-dev

# install and set global python interpreter
PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.9.0
pyenv global 3.9.0

# get sublime text editor
sudo snap install sublime-text --classic

# some utility 
sudo apt-get install tree \
  net-tools \
  vim

# third party plugin dir
mkdir -p ~/.vim/pack/third-party/start
VIM_PACK=~/.vim/pack/third-party/start

# install plugins
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

git clone git://github.com/jeffkreeftmeijer/vim-numbertoggle.git $VIM_PACK/vim-numbertoogle

git clone https://github.com/vim-airline/vim-airline $VIM_PACK/vim-airline

# setup rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://github.com/rust-lang/rust.vim ~/.vim/pack/plugins/start/rust.vim
echo -e 'let g:airline#extensions#tabline#enabled = 1' >> ~/.vimrc
echo -e 'syntax enable' >> ~/.vimrc
echo -e 'filetype plugin indent on' >> ~/.vimrc
echo -e 'let g:rustfmt_autosave = 1' >> ~/.vimrc
echo -e 'set ts=4' >> ~/.vimrc
echo -e 'set number' >> ~/.vimrc
echo -e 'set expandtab' >> ~/.vimrc
echo -e 'set splitbelow' >> ~/.vimrc
echo -e 'set autoread' >> ~/.vimrc

# get jdk: Amazon coretto (its easy to setup and manage)
wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add - 
sudo add-apt-repository 'deb https://apt.corretto.aws stable main'
sudo apt-get update && sudo apt-get install -y java-1.8.0-amazon-corretto-jdk
java -version # to check everything went well

# get chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb # remove installer post installation
  
# get starship (since its awesome)
curl -fsSL https://starship.rs/install.sh | bash
echo -e 'eval "$(starship init bash)"' >> ~/.bashrc

# get fira code font
sudo apt-get install fonts-firacode
