GREEN='\033[0;32m'
NC='\033[0m' 

better_vim_dir="$HOME/.config/better-vim"
coc_dir="$HOME/.config/coc"

clear
echo -e "⌛ Creating ${GREEN}neovim${NC} config"

# Creating the nvim structure
mkdir -p $HOME/.config/nvim/lua/
cp -r $PWD/core/lua/better-vim $HOME/.config/nvim/lua/
cp $PWD/core/init.vim $HOME/.config/nvim/

# Creating the better-vim config
if [ -d "$better_vim_dir" -a ! -h "$better_vim_dir" ]; then
  echo -e "- Found an existing ${GREEN}better-vim${NC} config"
else
  echo -e "- Creating the ${GREEN}better-vim${NC} directory"
  cp -r $PWD/defaults/ $HOME/.config/better-vim/
fi
  ln -sf $HOME/.config/better-vim/better-vim.lua $HOME/.config/nvim/lua/

# Creating the coc.nvim config
if [ -d "$coc_dir" -a ! -h "$coc_dir" ]; then
  echo -e "- Found an existing ${GREEN}coc.vim${NC} config"
else
  echo -e "- Creating the ${GREEN}coc.nvim${NC} directory"
  mkdir -p $HOME/.config/coc/extensions
  cp $PWD/core/coc-package.json $HOME/.config/coc/extensions/package.json
  cp $PWD/core/coc-settings.json $HOME/.config/nvim/
  rm -rf $HOME/.config/nvim/coc-package.json
fi

sleep 1
clear
echo -e "⌛ Installing ${GREEN}vim-plug${NC} (a plugins manager for neovim)"
# Installing vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' >/dev/null 2>&1

sleep 1
clear
echo -e "⌛ Installing ${GREEN}neovim${NC} plugins (using npm, may take a while 😮💨)"
nvim --headless +PlugInstall +qall >/dev/null 2>&1

clear
echo -e "⌛ Installing ${GREEN}coc.nvim${NC} dependencies"
npm install --prefix $HOME/.config/coc/extensions

clear
echo -e "Your ${GREEN}better-vim${NC} is ready."
echo -e "Type ${GREEN}nvim${NC} to open your new editor 🚀"
