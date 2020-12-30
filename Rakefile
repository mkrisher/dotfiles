require 'rake'

desc "symlink dotfiles into system-standard positions"
task :install do
  # TODO: install homebrew
  # TODO: install python3 using pyenv
  # TODO: install powerline fonts (https://github.com/powerline/fonts)
  # TODO: install neovim
  # TODO: install rbenv
  # TODO: install node
  # TODO: install yarn

  ####################################### Fonts
  #`git clone https://github.com/powerline/fonts.git`
  #`cd fonts`
  #`./install.sh`
  #`cd -`

  ######################################## Bash
  `echo "bash files"`
  `ln -s "$PWD/bash" "$HOME/.bash"`
  `ln -s "$PWD/bash/bash_profile" "$HOME/.bash_profile"`
  `ln -s "$HOME/.bash_profile" "$HOME/.bashrc"`
  `ln -s "$PWD/bash/bash_prompt" "$HOME/.bash_prompt"`

  ######################################## ZSH
  `echo "zsh files"`
  `ln -s "$PWD/zsh/zshrc" "$HOME/.zshrc"`

  ######################################## oh-my-zsh
  `echo "oh-my-zsh files"`
  `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
  `sh -c "exit"`
  `ln -s "$PWD/zsh/oh_my_zsh/custom/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"`

  ######################################## TMUX
  `echo "tmux files"`
  `ln -s "$PWD/tmux" "$HOME/.tmux"`
  `ln -s "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"`
  `cd /usr/local/bin`
  `curl -O https://raw.githubusercontent.com/jdxcode/tmux-spotify-info/master/tmux-spotify-info`
  `chmod 755 tmux-spotify-info`
  `cd -`

  ######################################## VIM
  `echo "vim files"`
  `ln -s "$PWD/vim" "$HOME/.vim"`
  `ln -s "$PWD/vim/vimrc" "$HOME/.vimrc"`

  ######################################## Neovim
  `echo "neovim files"`
  `ln -s "$PWD/config" "$HOME/.config"`
  # vim-plug
  `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
  # node client for neovim
  `npm install -g @chemzqm/neovim`
  `gem install neovim`
  `gem install solargraph`

  ######################################## Git
  `echo "git files"`
  `brew install git`
  `ln -s "$PWD/git/gitconfig.symlink" "$HOME/.gitconfig"`

  ######################################## SBT
  `echo "sbt files"`
  `ln -s "$PWD/sbt" "$HOME/.sbt"`

  ######################################## Python
  `echo "python files"`
  `pip3 install --upgrade pip`
  `pip3 install --user websocket-client sexpdata neovim`

  ######################################## ENV files
  `echo "env files"`
  `touch $HOME/.aliases`
  `touch $HOME/.env`
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

