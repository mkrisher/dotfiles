require "rake"

# This installs and configs the following:
#
# - a file structure following the PARA method in the home directory
# - an .aliases and .env file for global aliases and environment variables
# - homebrew
# - developer fonts
# - ZSH and oh-my-zsh
# - tmux
# - git
# - Ruby version 3.x - via rbenv
# - Python version 3.x - via pyenv
# - Node (and yarn)
# - Neovim

desc "symlink dotfiles into system-standard positions (inside .config)"
task :install do
  ######################################## file structure
  `echo "PARA files"`
  `mkdir $HOME/projects`
  `mkdir $HOME/areas`
  `mkdir $HOME/resources`
  `mkdir $HOME/archive`

  ######################################## ENV files
  `echo "alias and env files"`
  # TODO: define some shared entries in dotfiles repo
  `touch $HOME/.config/.aliases`
  `touch $HOME/.config/.env`

  ######################################## oh-my-zsh
  `echo "oh-my-zsh files"`
  `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
  `sh -c "$(git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.config/oh-my-zsh/custom}/plugins/zsh-autosuggestions)"`
  `ln -s "$PWD/config/zsh/oh_my_zsh/custom/aliases.zsh" "$HOME/.config/oh-my-zsh/custom/aliases.zsh"`

  ######################################## ZSH
  `echo "zsh files"`
  `ln -s "$PWD/config/zsh/zshrc" "$HOME/.config/.zshrc"` # copy from dotfiles into .config directory
  `ln -s "$HOME/.config/.zshrc" "$HOME/.zshrc"` # zsh expects the config file to live at HOME vs .config

  ######################################## TMUX
  `echo "tmux files"`
  `ln -s "$PWD/config/tmux/tmux.conf" "$HOME/.config/.tmux.conf"` # copy from dotfiles into .config directory
  `ln -s "$HOME/.config/.tmux.conf" "$HOME/.tmux.conf"` # tmux expects the config file to live at HOME vs .config

  ######################################## Git
  `echo "git files"`
  `ln -s "$PWD/config/git/gitconfig.symlink" "$HOME/.config/.gitconfig"`
  `ln -s "$HOME/.config/.gitconfig" "$HOME/.gitconfig"`

  ######################################## Ruby
  `echo "ruby files"`
  `gem install bundler`
  `gem install tmuxinator`
  `gem install neovim`

  ######################################## Neovim
  `echo "neovim files"`
  # install astronvim into config/nvim directory, not copied from dotfiles
  `git clone --depth 1 https://github.com/AstroNvim/AstroNvim $HOME/.config/nvim`
  # put astronvim overrides in place
  `ln -s "$PWD/config/nvim.custom/lua/user" "$HOME/.config/nvim/lua/user"`

  ######################################## messages
  `echo "DONE!"`
end

desc "install system dependencies required by dotfiles"
task :dependencies do
  ####################################### Homebrew
  `echo "installing homebrew"`
  brew = `which brew`
  if brew.empty?
    `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
  else
    `echo "homebrew already installed"`
  end

  ####################################### Fonts
  `echo "installing fonts"`
  dir = `ls $HOME/.config/fonts`
  if dir.empty?
    `git clone https://github.com/powerline/fonts.git $HOME/.config/fonts`
    `cd $HOME/.config/fonts`
    `bin/shell install.sh`
    `cd -`
  else
    `echo "fonts already installed"`
  end

  ######################################## ZSH
  `echo "installing zsh"`
  zsh = `which zsh`
  if zsh.empty?
    `brew install zsh`
  else
    `echo "zsh already installed"`
  end

  ######################################## oh-my-zsh
  `echo "oh-my-zsh files"`
  oh_my_zsh = `ls $HOME/.config/oh-my-zsh` # can this use ~/.config
  if oh_my_zsh.empty?
    `sh -c ZSH_CUSTOM=$HOME/.config/oh-my-zsh/custom`
    `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
    `sh -c "exit"`
  else
    `echo "oh-my-zsh already installed"`
  end

  ######################################## TMUX
  `echo "installing tmux"`
  tmux = `which tmux`
  if tmux.empty?
    `brew install tmux`
    `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
    # TODO: figure out how to activate tmux plugins (prefix + I)
  else
    `echo "tmux already installed"`
  end

  ######################################## Git
  `echo "installing git"`
  git = `which git`
  if git.empty?
    `brew install git`
  else
    `echo "git already installed"`
  end

  ######################################## GitHub CLI
  `echo "installing GitHub CLI"`
  gh = `ls $HOME/.config/gh`
  if gh.empty?
    `brew install gh`
  else
    `echo "github cli already installed"`
  end

  ######################################## Ruby
  `echo "installing Ruby versions via rbenv"`
  rbenv = `which rbenv`
  if rbenv.empty?
    `brew install rbenv`
    `rbenv install 3.0.3`
    `rbenv install 3.1.2`
  else
    `echo "rbenv already installed"`
  end

  ######################################## Python
  `echo "installing Python 3.8.3 via pyenv"`
  pyenv = `which pyenv`
  if pyenv.empty?
    `brew install pyenv`
    `pyenv install 3.8.3`
    `pip3 install --upgrade pip`
    `pip3 install --user websocket-client sexpdata neovim`
  else
    `echo "pyenv already installed"`
  end

  ######################################## Node
  `echo "installing node"`
  node = `which node`
  if node.empty?
    `brew install node`
  else
    `echo "node already installed"`
  end

  ######################################## yarn
  `echo "install yarn (for node)"`
  yarn = `ls /usr/local/bin/yarn`
  if yarn.empty?
    `npm install -g yarn`
  else
    `echo "yarn already installed"`
  end

  ######################################## Neovim
  `echo "installing neovim"`
  nvim = `which nvim`
  if nvim.empty?
    `brew install neovim`
  else
    `echo "neovim already installed"`
  end

  ######################################## messages
  `echo "DONE!"`
  `echo "- to install tmux plugins, open session and press prefix + I"`
  `echo "- to install dotfiles run: rake install"`
end

desc "remove symlinked dotfiles"
task :uninstall do
  # TODO: make sure everything goes into the .config directory
  `rm -Rf "$HOME/.config"`

  `pip3 uninstall websocket-client sexpdata neovim`
  `gem uninstall neovim`
  `gem uninstall tmuxinator`
  `gem uninstall bundler`
end

task default: "install"
