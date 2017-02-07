# dotfiles

## Vim configs (.vimrc & vimrc.bundles)

1. If you already have a vim setup, move it safely out of the way or back it up.
```bash
mv ~/.vimrc ~/.vimrc_backup
mv ~/.vimrc.bundles ~/.vimrc.bundles_backup
```
2. Clone `dotfiles` where ever you want and link configs
```bash
cd ~/src/                       # Or wherever you keep your cloned repos
git clone https://github.com/mkirvela/dotfiles/ && cd dotfiles
ln -s `pwd`/.vimrc ~/.vimrc     # Link to the cloned vim config
ln -s `pwd`/.vimrc.bundles ~/.vimrc.bundles
```
