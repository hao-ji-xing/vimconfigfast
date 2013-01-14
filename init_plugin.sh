
exist=0;
while read line
do 
    repo=`echo $line | awk '{split($0,a,"/"); print a[5]}' | awk '{split($0,b,".git"); print b[1]}'`
    if [ -d _vim/bundle/$repo ]; then
        exist=1
        echo '$repo already exist';
    else
        git submodule add $line _vim/bundle/$repo
    fi
done < pluginlist

git submodule init
git submodule update




