git submodule init
git submodule update

echo 'Copy .vim folder'
cp ./_vim ~/.vim -r 
echo 'Copy .vimrc file'
cp ./_vimrc ~/.vimrc
cp 'Config pathogen plugin'
cp ~/.vim/bundle/vim-pathogen/autoload/ ~/.vim
echo 'Every thing setup~'
