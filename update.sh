GREEN='\033[0;32m'
NC='\033[0m' 
. $PWD/scripts/functions.sh

is_valid=$(has_valid_license)


if $is_valid == "true"; then
echo -e "⌛ Updating your ${GREEN}better-vim${NC} config"
  # Removing existing better-vim folders
  rm -rf $HOME/.config/nvim/lua/better-vim/
  rm $HOME/.config/nvim/init.vim

  # Moving better-vim files to nvim/
  cp -r $PWD/core/lua/better-vim $HOME/.config/nvim/lua/
  cp $PWD/core/init.vim $HOME/.config/nvim/

  # Just to make sure that we'll updating/removing new/unused plugins
  nvim --headless +PlugClean! +qall >/dev/null 2>&1
  nvim --headless +PlugInstall +qall >/dev/null 2>&1

  clear
  echo -e "✅ Updated your ${GREEN}better-vim${NC} config successfully."
else
  echo -e "Provide a valid ${GREEN}better-vim${NC} license."
fi
