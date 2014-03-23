# dotvim

This is my Vim configuration

This was previously part of [CLIenv](https://github.com/anygard/CLIenv) but is now in its own repository.

Turns out gitolit did not like the .vim name so I renamed it to dotvim, if you clone like this 

    git clone https://github.com/anygard/dotvim .vim
    
in your home dir it ends upp in ~/.vim 

## Installation

Simply clone the repository and run the platform appropriate install script. Make sure to run the script from the directory it resides in.

### Caveat

If you use it in a directory other then ~/.vim make sure to change the 

    set rtp+=~/.vim/bundle/vundle/

line in .vimrc accordingly
