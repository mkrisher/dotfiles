require 'rake'

desc "symlink dotfiles into system-standard positions"
task :install do
    ######################################## Bash
  `echo "bash files"`
  `ln -s "$PWD/bash" "$HOME/.bash"`
  `ln -s "$PWD/bash/bash_profile" "$HOME/.bash_profile"`
  `ln -s "$HOME/.bash_profile" "$HOME/.bashrc"`
  `ln -s "$PWD/bash/bash_prompt" "$HOME/.bash_prompt"`

  ######################################## oh-my-zsh
  `echo "oh-my-zsh files"`
  `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
  `sh -c "$(git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions)"`
  `ln -s "$PWD/zsh/oh_my_zsh/custom/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"`

  ######################################## ZSH
  `echo "zsh files"`
  `ln -s "$PWD/zsh/zshrc" "$HOME/.zshrc"`

  ######################################## TMUX
  `echo "tmux files"`
  `git clone https://github.com/jdxcode/tmux-spotify-info.git ~/.tmux/plugins/tmux-spotify-info`
  `cp ~/.tmux/plugins/tmux-spotify-info/tmux-spotify-info /usr/local/bin`
  `cd /usr/local/bin`
  `chmod 755 tmux-spotify-info`
  `cd -`
  `ln -s "$PWD/tmux" "$HOME/.tmux"`
  `ln -s "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"`

  ######################################## VIM
  `echo "vim files"`
  `ln -s "$PWD/vim" "$HOME/.vim"`
  `ln -s "$PWD/vim/vimrc" "$HOME/.vimrc"`

  ######################################## Git
  `echo "git files"`
  `ln -s "$PWD/git/gitconfig.symlink" "$HOME/.gitconfig"`

  ######################################## Ruby
  `echo "ruby files"`
  `gem install bundler`
  `gem install tmuxinator`

  ######################################## Neovim
  `echo "neovim files"`
  `ln -s "$PWD/config" "$HOME/.config"`
  # vim-plug
  `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
  # node client for neovim
  `npm install -g @chemzqm/neovim`
  `gem install neovim`
  `gem install solargraph`
  `brew install the_silver_searcher`

  ######################################## ENV files
  `echo "env files"`
  `touch $HOME/.aliases`
  `touch $HOME/.env`
  `echo "local files for aliases and environment variables created in user directory"`

  ######################################## messages
  `echo "DONE!"`
  `echo "- to install tmux plugins, open session and press prefix + I"`
  `echo "- to install vim plugins, open session and run :PlugInstall"`
  `echo "- Nord theme is avaibale for iterm: https://github.com/arcticicestudio/nord-iterm2"`
end

desc "remove symlinked dotfiles"
task :uninstall do
  `rm "$HOME/.bash"`
  `rm "$HOME/.bash_profile"`
  `rm "$HOME/.bashrc"`
  `rm "$HOME/.bash_prompt"`
  `rm "$HOME/.zshrc"`
  `rm "$HOME/.tmux"`
  `rm "$HOME/.tmux.conf"`
  `rm "$HOME/.vim"`
  `rm "$HOME/.vimrc"`
  `rm "$HOME/.gitconfig"`
  `rm "$HOME/.sbt"`
  `rm -Rf "$HOME/.config"`
  `rm -Rf "$HOME/.oh-my-zsh"`

  # uninstall
  # yarn,
  # node,
  # python (via pyenv),
  # ruby (via rbenv),
  # tmux,
  #  oh-my-zsh
  `pip3 uninstall websocket-client sexpdata neovim`
  `npm uninstall @chemzqm/neovim`
  `gem uninstall neovim`
  `gem uninstall solargraph`
end

task :default => 'install'

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
  dir = `ls | grep fonts`
  if dir.empty?
    `git clone https://github.com/powerline/fonts.git`
    `cd fonts`
    `./install.sh`
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
  oh_my_zsh = `ls ~/.oh-my-zsh`
  if oh_my_zsh.empty?
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

  ######################################## Ruby
  `echo "installing Ruby 2.7.2 via rbenv"`
  rbenv = `which rbenv`
  if rbenv.empty?
    `brew install rbenv`
    `rbenv install 2.7.2`
  else
    `echo "rbenv already installed"`
  end

  ######################################## Python
  `echo "installing Python 3.9.0 via pyenv"`
  pyenv = `which pyenv`
  if pyenv.empty?
    `brew install pyenv`
    `pyenv install 3.9.0`
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
  yarn = `npm list -g | grep yarn`
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
  `echo "- Nord theme is avaibale for iterm: https://github.com/arcticicestudio/nord-iterm2"`
  `echo "- to install dotfiles run: rake install"`
end

desc "remove symlinked dotfiles"
task :uninstall do
  `rm "$HOME/.bash"`
  `rm "$HOME/.bash_profile"`
  `rm "$HOME/.bashrc"`
  `rm "$HOME/.bash_prompt"`
  `rm "$HOME/.zshrc"`
  `rm "$HOME/.tmux"`
  `rm "$HOME/.tmux.conf"`
  `rm "$HOME/.vim"`
  `rm "$HOME/.vimrc"`
  `rm "$HOME/.gitconfig"`
  `rm "$HOME/.sbt"`
  `rm -Rf "$HOME/.config"`
  `rm -Rf "$HOME/.oh-my-zsh"`
  `rm "$HOME/.aliases"`
  `rm "$HOME/.env"`

  `pip3 uninstall websocket-client sexpdata neovim`
  `npm uninstall @chemzqm/neovim`
  `gem uninstall neovim`
  `gem uninstall solargraph`
end

task :default => 'install'

