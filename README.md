# Installation
## For Linux distros
Simply clone the repository using the `git clone` command and run a file using neovim `nvim <filename>`. 
Let **lazy.nvim** do its magic  
> ⚠️ Look for the requirements of each plugin used in their respective github repository

## For Windows
Windows stores all its config files in `%APPDATA%/Local/nvim` and all its related nvim data to `%APPDATA%/Local/nvim-data`.  
Cloning this repo to the *nvim/* folder must do the work for your.  
However I faced an issue with the ***clangd*** LSP in windows, because the default `clangd.exe` files installed using **Mason** did not find the header files for c and c++ which were installed using **Mingw**.  
To solve this issue:
1. First install `clang` and `clangd` using **Mingw**:
    ```
    pacman -S mingw_w64-x86_64-clang
    ```
    and  
    ```
    pacman -S mingw_w64-x86_64-clang-tools-extra

    ```
    After you are done with this, you will have `clang`, `gcc`, `g++` and other tools like `clangd` on the `mingw64/bin`.  

2. Change the default path for `clangd.exe` used by neovim:  
To do so, go to `/nvim-data/mason/bin` where you will find the path for the `clangd.exe` used by neovim as a language server. Change this path to the path of the `clangd` we installed using **Mingw**.  
Now you should be fine with the errors given by `clangd` stating header files not found.
    > ⚠️ Make sure you have *path* set to the environment variable.

