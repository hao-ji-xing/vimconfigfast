plugins=(
https://github.com/tpope/vim-pathogen.git 
https://github.com/Lokaltog/vim-powerline.git
https://github.com/jiangmiao/auto-pairs.git 
https://github.com/vim-scripts/genutils.git 
https://github.com/vim-scripts/multiselect.git 
https://github.com/scrooloose/nerdtree.git 
https://github.com/msanders/snipmate.vim.git
https://github.com/vim-scripts/taglist.vim.git 
https://github.com/lepture/vim-javascript.git 
https://github.com/maksimr/vim-jsbeautify.git 
https://github.com/sickill/vim-monokai.git 
https://github.com/jistr/vim-nerdtree-tabs.git 
https://github.com/mattn/zencoding-vim.git
)

vimhomeDir=~/dev/test/
vimrcUrl=https://raw.github.com/darkfe/vimconfigfast/master/_vimrc
bundleDir=${vimhomeDir}bundle/
pathogenDir=${bundleDir}vim-pathogen/

if [ ! -d $vimhomeDir ]; then
    mkdir $vimhomeDir
fi

for line in ${plugins[*]}
do 
    if [ "$line" != "###" ]; then

        repoUrl=`echo ${line#*#}`
        repoName=`echo ${line#*#} | awk '{split($0,a,"/"); print a[5]}' | awk '{split($0,b,".git"); print b[1]}'`
        repoDir=$bundleDir$repoName

        if [ -d $repoDir ]; then
            echo "[$repoName] plugin is allready exsit, try exec git-pull."
            cd $repoDir
            git pull
            cd - >/dev/null
        else 
            if [ "$repoName" == 'taglist.vim' ];then
                if type ctags >/dev/null 2>&1 ;then
                    echo "[$repoName] plugin start install."
                    git clone $repoUrl $repoDir
                else
                    echo "Cat't find 'ctags', stop install taglist.vim."
                fi
            else
                echo "[$repoName] plugin start install."
                git clone $repoUrl $repoDir
            fi
        fi

    else
        break
    fi
done 

if [ -d $pathogenDir ]; then
    cp -r $pathogenDir/autoload $vimhomeDir/autoload 

    #backup old vimrc file
    if [ -f ~/.vimrc -a  ]; then
        if [ ! -d ~/.vimrcbak/ ]; then
            mkdir ~/.vimrcbak/
        fi
        ds=`date +%s`
        cp ~/.vimrc ~/vimrcbak/.vimrc_$ds
    fi

    curl $vimrcUrl > ~/.vimrc 
else
    echo "[vim-pathogen] install fail, please check your network."
fi
