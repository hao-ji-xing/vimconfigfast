## vimconfigfast

vimconfigfast 是一个为vim快速安装常用插件和设置常用配置的shell脚本

你只需要一句命令即可快速在linux或者mac中完成vim的配置工作:

```
curl https://raw.github.com/darkfe/vimconfigfast/master/install.sh | bash
```

vimconfigfast 使用vim-pathogen来管理插件

默认预装了如下插件
* https://github.com/tpope/vim-pathogen.git 
* https://github.com/jiangmiao/auto-pairs.git 
* https://github.com/vim-scripts/genutils.git 
* https://github.com/vim-scripts/multiselect.git 
* https://github.com/scrooloose/nerdtree.git 
* https://github.com/msanders/snipmate.vim.git
* https://github.com/vim-scripts/taglist.vim.git 
* https://github.com/lepture/vim-javascript.git 
* https://github.com/maksimr/vim-jsbeautify.git 
* https://github.com/sickill/vim-monokai.git 
* https://github.com/jistr/vim-nerdtree-tabs.git 
* https://github.com/mattn/zencoding-vim.git

并且使用这份vimrc文件

<https://github.com/darkfe/vimconfigfast/blob/master/_vimrc>

默认配置了

* zencoding
* nerdtree
* taglist

代码主题配置为
monokai

就是这样.

TODO 

* 对vimrc的备份策略要重新想一想

