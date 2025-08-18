# Set up the dotfiles
first git clone url then in `~/.dotfiles` run
```
stow .
```
to update tpm and oh-my-zsh submodules: 
```
git submodule update --init --recursive
```
then launch tmux and run: `prefix + I` to reinstall plugins
