require 'rake'

desc "symlink dotfiles into system-standard positions."
task :install do
  # symlink the bash_profile
  # symlink the bash_prompt
  # symlink the zshrc
  # symlink the .tmux directory
  # symlink the .tmux.conf file
  # symlink the .vim directory
  # symlink the .vimrc file
  # symlink the .gitconfig file
  # symlink the .config/neovim files
  # symlink the .sbt files
  # install vim plugins

  `ln -s "$PWD/bash" "$HOME/.bash"`
  `ln -s "$PWD/bash/bash_profile" "$HOME/.bash_profile"`
  `ln -s "$HOME/.bash_profile" "$HOME/.bashrc"`
  `ln -s "$PWD/bash/bash_prompt" "$HOME/.bash_prompt"`

  `ln -s "$PWD/zsh/zshrc" "$HOME/.zshrc"`

  `ln -s "$PWD/tmux" "$HOME/.tmux"`
  `ln -s "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"`

  `ln -s "$PWD/vim" "$HOME/.vim"`
  `ln -s "$PWD/vim/vimrc" "$HOME/.vimrc"`

  `ln -s "$PWD/git/gitconfig.symlink" "$HOME/.gitconfig"`

  `ln -s "$PWD/sbt" "$HOME/.sbt"`

  # assumes vundle is not already copied over and in place
  	#`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
  	#`vim +PluginInstall +qall`

  # symlink neovim configuration file
  `ln -s "$PWD/config" "$HOME/.config"`

  # install pips (assumes pip3 installed)
  `pip3 install websocket-client sexpdata neovim`

  # install oh-my-zsh
  `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

  # put custom zsh in place
  `ln -s "$PWD/zsh/oh_my_zsh/custom/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"`

  `cat $HOME/.aliases`
  `cat $HOME/.env`
end

desc "remove symlinked dotfiles"
task :uninstall do
  `rm "$HOME/.bash"`
  `rm "$HOME/.bash_profile"`
  `rm "$HOME/.bashrc"`
  `rm "$HOME/.bash_prompt"`
  `rm "$HOME/..zshrc"`
  `rm "$HOME/.tmux"`
  `rm "$HOME/.tmux.conf"`
  `rm "$HOME/.vim"`
  `rm "$HOME/.vimrc"`
  `rm "$HOME/.gitconfig"`
  `rm "$HOME/.sbt"`
  `rm -Rf "$HOME/.config"`
  `rm -Rf "$HOME/.oh-my-zsh"`

  `pip3 uninstall websocket-client sexpdata neovim`
end

task :default => 'install'

