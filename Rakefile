require 'rake'

# This installs and configs the following:
#
# - a file structure following the PARA method in the home directory
# - an .aliases and .env file for global aliases and environment variables local to the machine
# - homebrew and a Brewfile
# - developer fonts
# - zellij
# - git
# - Neovim
# - LazyVim
# - Mise
# - Ruby, Python, Node, Rust versions (via Mise)

# Coming soon:
# - add a brag list file

desc 'symlink dotfiles into system-standard positions (inside .config)'
task :install do
  ######################################## file structure
  `echo "PARA files"`
  `mkdir $HOME/projects`
  `mkdir $HOME/areas`
  `mkdir $HOME/resources`
  `mkdir $HOME/archive`

  ######################################## ENV files
  `echo "alias and env files"`
  `touch $HOME/.config/.aliases`
  `touch $HOME/.config/.env`

  ######################################## Brewfile
  `echo "brewfile"`
  `ln -s "$PWD/Brewfile" "$HOME/Brewfile"`

  ######################################## Mise
  `echo "mise files"`
  `ln -s "$PWD/config/mise/config.toml" "$HOME/.config/mise/config.toml"`

  ######################################## Zellij
  `echo "zellij files"`
  `ln -s "$PWD/config/zellij/config.kdl" "$HOME/.config/zellij/config.kdl"`

  ######################################## TMUX
  `echo "tmux files"`
  `ln -s "$PWD/config/tmux/tmux.conf" "$HOME/.config/.tmux.conf"` # copy from dotfiles into .config directory
  `ln -s "$HOME/.config/.tmux.conf" "$HOME/.tmux.conf"` # tmux expects the config file to live at HOME vs .config

  ######################################## Git
  `echo "git files"`
  `ln -s "$PWD/config/git/gitconfig.symlink" "$HOME/.config/.gitconfig"`
  `ln -s "$HOME/.config/.gitconfig" "$HOME/.gitconfig"`

  ######################################## Neovim
  `echo "neovim files"`
  `ln -s "$PWD/config/nvim" "$HOME/.config/nvim"`

  ######################################## Install dependncies
  `echo "dependencies"`

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
    `./install.sh`
    `cd -`
  else
    `echo "fonts already installed"`
  end

  ######################################## brew packages
  `echo "installing Homebrew packages"`
  `brew bundle install`

  ######################################## TMUX
  `echo "installing tmux"`
  tmux = `which tmux`
  if tmux.empty?
    `brew install tmux`
  else
    `echo "tmux already installed"`
  end
  tpm = `ls $HOME/.tmux/plugins/tpm`
  `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` if tpm.empty?

  ######################################## languages
  `echo "installing languages"`

  ######################################## Ruby
  `echo "installing Ruby versions via mise"`
  `mise use -g ruby@3.4.4`
  `gem install bundler`
  `gem install tmuxinator`
  `gem install neovim`
  `echo "mise already installed, additinoal ruby versions can be installed with: mise exec ruby@3.4.4"`

  ######################################## Python
  `echo "installing Python 3 via mise"`
  `mise use -g python@3`
  `echo "mise already installed, additional python versions can be installed with: mise exec python@3"`

  ######################################## Node
  `echo "installing node"`
  `mise use -g node@22`
  `echo "mise already installed, additional node versions can be installed with: mise exec node@22"`

  ######################################## Rust
  `echo "installing rust"`
  `mise use -g rust`
  `echo "mise already installed, additional rust toolchains can be installed with: mise use -g rust@1.82 && cargo build"`

  ######################################## Mise catalog
  `mise ls`

  ######################################## messages
  `echo press leader + I inside first tmux session to install plugins using tpm`
  `echo "DONE!"`
end

desc 'remove symlinked dotfiles'
task :uninstall do
  # TODO: don't remove the whole directory
  `rm -Rf "$HOME/.config"`
  `rm -Rf "$HOME/Brewfile"`

  `rm -Rf $HOME/projects`
  `rm -Rf $HOME/areas`
  `rm -Rf $HOME/resources`
  `rm -Rf $HOME/archive`

  `gem uninstall neovim`
  `gem uninstall tmuxinator`
  `gem uninstall bundler`
end

task default: 'install'
