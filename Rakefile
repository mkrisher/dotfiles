require 'rake'

desc "symlink dotfiles into system-standard positions."
task :install do
  # symlink the bash_profile
  # symlink the bash_prompt
  # symlink the .tmux directory
  # symlink the .tmux.conf file
  # symlink the .vim directory
  # symlink the .vimrc file
  # install vim plugins

  `ln -s "$PWD/bash" "$HOME/.bash"`
  `ln -s "$PWD/bash/bash_profile" "$HOME/.bash_profile"`
  `ln -s "$PWD/bash/bash_prompt" "$HOME/.bash_prompt"`
  `ln -s "$PWD/tmux" "$HOME/.tmux"`
  `ln -s "$PWD/tmux/tmux_conf" "$HOME/.tmux.conf"`
  `ln -s "$PWD/vim" "$HOME/.vim"`
  `ln -s "$PWD/vim/vimrc" "$HOME/.vimrc"`
  `vim +PluginInstall +qall`
end

desc "remove symlinked dotfiles"
task :uninstall do
  `rm "$HOME/.bash"`
  `rm "$HOME/.bash_profile"`
  `rm "$HOME/.bash_prompt"`
  `rm "$HOME/.tmux"`
  `rm "$HOME/.tmux.conf"`
  `rm "$HOME/.vim"`
  `rm "$HOME/.vimrc"`
end

task :default => 'install'

