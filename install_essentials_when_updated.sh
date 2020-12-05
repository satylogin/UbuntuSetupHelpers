# the essential
sudo apt-get update
sudo apt-get upgrade

# get c++ compiler
sudo apt-get install g++

# get git
sudo apt-get install git

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
  liblzma-dev

# install and set global python interpreter
pyenv install 3.8.5
pyenv global 3.8.5

# get sublime text editor
sudo snap install sublime-text --classic

# setup rust 
curl https://sh.rustup.rs -sSf | sh

# get chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb # remove installer post installation
