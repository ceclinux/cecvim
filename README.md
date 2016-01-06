```
   _,.----.       ,----.    _,.----.         ,-.-. .=-.-.       ___   
 .' .' -   \   ,-.--` , \ .' .' -   \ ,--.-./=/ ,//==/_ /.-._ .'=.'\  
/==/  ,  ,-'  |==|-  _.-`/==/  ,  ,-'/==/, ||=| -|==|, |/==/ \|==|  | 
|==|-   |  .  |==|   `.-.|==|-   |  .\==\,  \ / ,|==|  ||==|,|  / - | 
|==|_   `-' \/==/_ ,    /|==|_   `-' \\==\ - ' - /==|- ||==|  \/  , | 
|==|   _  , ||==|    .-' |==|   _  , | \==\ ,   ||==| ,||==|- ,   _ | 
\==\.       /|==|_  ,`-._\==\.       / |==| -  ,/|==|- ||==| _ /\   | 
 `-.`.___.-' /==/ ,     / `-.`.___.-'  \==\  _ / /==/. //==/  / / , / 
             `--`-----``                `--`--'  `--`-` `--`./  `--`  
```

My vim configuration

##ScreenShots

![](http://img.vim-cn.com/d6/05538f30158dcb3c8173c1dd015c9a287eddf7.jpg)

##How To Install

```
cd
git clone https://github.com/ceclinux/cecvim.git
mv cecvim .vim
ln -s .vim/vimrc .vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c 'BundleInstall'
cd .vim/bundle/YouCompleteMe
python2 install.py --clang-completer
cd
wget raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py
vim -c 'VimProcInstall'
```


**ENJOY**:smile:

##dependencies

- silver-searcher-git //for replacement of grep
- ctags //for tagbar
- fanyi(npm install -g fanyi) //translate the word under cursor to chinese
