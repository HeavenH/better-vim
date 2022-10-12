GREEN='\033[0;32m'
NC='\033[0m' 

nvim_backup_dir="$HOME/.config/__better-vim-nvim-backup"
coc_backup_dir="$HOME/.config/__better-vim-coc-backup"

if [ -d "$coc_backup_dir" -a ! -h "$coc_backup_dir" ]
then
   rm -rf ~/.config/coc/
   mv "$coc_backup_dir" $HOME/.config/coc
   echo "We recovered your previous ${GREEN}coc.nvim${NC} config. 🪄"
   npm install --prefix $HOME/.config/coc/extensions
fi

if [ -d "$nvim_backup_dir" -a ! -h "$nvim_backup_dir" ]
then
   rm -rf ~/.config/nvim/
   mv "$nvim_backup_dir" $HOME/.config/nvim
   echo "We recovered your previous ${GREEN}nvim${NC} config. 🪄"
else
   rm -rf ~/.config/nvim
   if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      sudo apt-get remove neovim python3-neovim ripgrep
   elif [[ "$OSTYPE" == "darwin"* ]]; then
      brew remove neovim tree-sitter luajit 
   else 
      echo "Oops, something went wrong."
   fi
fi
