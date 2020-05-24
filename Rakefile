require 'rake'

desc "symlink dotfiles into system-standard positions"
task :install do
  ######################################## Bash
  `ln -s "$PWD/bash" "$HOME/.bash"`
  `ln -s "$PWD/bash/bash_profile" "$HOME/.bash_profile"`
  `ln -s "$HOME/.bash_profile" "$HOME/.bashrc"`
  `ln -s "$PWD/bash/bash_prompt" "$HOME/.bash_prompt"`

  ######################################## ZSH
  `ln -s "$PWD/zsh/zshrc" "$HOME/.zshrc"`

  ######################################## oh-my-zsh
  `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
  `ln -s "$PWD/zsh/oh_my_zsh/custom/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"`

  ######################################## TMUX
  `ln -s "$PWD/tmux" "$HOME/.tmux"`
  `ln -s "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"`

  ######################################## VIM
  `ln -s "$PWD/vim" "$HOME/.vim"`
  `ln -s "$PWD/vim/vimrc" "$HOME/.vimrc"`
  # assumes vundle is not already copied over and in place
  	#`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
  	#`vim +PluginInstall +qall`

  ######################################## Neovim
  `ln -s "$PWD/config" "$HOME/.config"`

  ######################################## Git
  `ln -s "$PWD/git/gitconfig.symlink" "$HOME/.gitconfig"`

  ######################################## SBT
  `ln -s "$PWD/sbt" "$HOME/.sbt"`

  ######################################## Python
  `pip3 install websocket-client sexpdata neovim`

  ######################################## ENV files
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
end

task :default => 'install'

