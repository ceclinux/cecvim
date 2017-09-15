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

## ScreenShots

![](https://i.loli.net/2017/09/15/59bb89428a8a9.png)

## How To Install

```
cd
git clone https://github.com/ceclinux/cecvim.git
mv cecvim .vim
ln -s .vim/vimrc .vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall'
cd
wget raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py
```


**ENJOY**:smile:

## dependencies

- silver-searcher-git //for replacement of grep
- fanyi(npm install -g fanyi) //translate the word under cursor to chinese
- fzf

