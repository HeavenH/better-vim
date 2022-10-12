GREEN='\033[0;32m'
NC='\033[0m' 
. $PWD/scripts/functions.sh

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get install jq
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install jq
  else 
    echo "Oops, something went wrong."
  fi

clear
nvim_dir="$HOME/.config/nvim"
coc_dir="$HOME/.config/coc"
is_valid=$(has_valid_license)

if $is_valid == "true"; then
  if [ -d "$coc_dir" -a ! -h "$coc_dir" ]
  then
     echo "Found an existing coc.nvim config. We're creating a backup copy. 🪄"
     mv "$nvim_dir" $HOME/.config/__better-vim-coc-backup
  fi

  if [ -d "$nvim_dir" -a ! -h "$nvim_dir" ]
  then
     echo "Found an existing neovim config. We're creating a backup copy. 🪄"
     mv "$nvim_dir" $HOME/.config/__better-vim-nvim-backup
  fi

  echo "----------------------------------------------------------"
  echo -e "Creating your ${GREEN}better-vim${NC} configuration ⚙️"
  echo "----------------------------------------------------------"      

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    /bin/bash $PWD/scripts/install-linux.sh
    /bin/bash $PWD/scripts/create-neovim-config.sh
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    /bin/bash $PWD/scripts/install-mac.sh
    /bin/bash $PWD/scripts/create-neovim-config.sh
  else 
    echo "Oops, something went wrong."
  fi
else
  echo -e "Provide a valid ${GREEN}better-vim${NC} license."
fi
