GREEN='\033[0;32m'
NC='\033[0m' 

echo "⌛ Installing neovim"
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt install neovim

clear
echo -e "⌛ Installing ${GREEN}neovim${NC} dependencies"
sudo apt-get install python-dev python-pip python3-dev python3-pip
pip3 install --user --upgrade neovim 
sudo apt-get install ripgrep
