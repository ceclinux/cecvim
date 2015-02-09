cecvim
======

my vim configuration

##效果

![](http://img.vim-cn.com/33/6fd2f1a4688c3de24c183badf8c215dba9f7fb.png)

##如何安装

```
cd
git clone https://github.com/ceclinux/cecvim.git
mv cecvim .vim
ln -s .vim/vimrc .vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
然后进入vim
输入`:BundleInstall`

##依赖

- python-jedi
- python2-jedi
- silver-searcher-git
- ctags
    - autopep8
- js-beautify(npm install -g js-beautify)
