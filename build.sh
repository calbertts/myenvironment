cp ~/.config/nvim/init.vim init.vim
cp -R ~/.config/nvim/rplugin rplugin
docker build . -t calbertts/myenvironment
