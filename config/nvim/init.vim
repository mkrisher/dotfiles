"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

source $HOME/dotfiles/config/nvim/plugins/plugins.vim
source $HOME/dotfiles/config/nvim/general/settings.vim
source $HOME/dotfiles/config/nvim/general/mappings.vim
source $HOME/dotfiles/config/nvim/general/functions.vim

lua <<EOF
  require('lualine').setup {
    options = {
      theme = 'nord'
    }
  }

  require('nvim-treesitter.configs').setup {
    ensure_installed = { "javascript", "ruby", "comment" },
  }
EOF
