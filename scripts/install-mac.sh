GREEN='\033[0;32m'
NC='\033[0m' 

echo "⌛ Installing neovim"
brew install neovim

clear
echo -e "⌛ Installing ${GREEN}neovim${NC} dependencies"
brew install tree-sitter 
brew install luajit 
brew install python3 
pip3 install --user --upgrade neovim 
python3 -m pip install --user --upgrade pynvim
brew install ripgrep 
