# Promix icon-theme


### Promix is a flat colorful  icon theme adaptive with [wpgtk](https://github.com/deviantfero/wpgtk/tree/master/wpgtk) ,which works on pywal also .
Promax is a mix of deepin and tela-cricle icon-theme 

![thun](https://github.com/user-attachments/assets/67270c31-7125-485d-816e-0425106094d1)

## Installation 
### for easy install 
- make sure you have WPGTK installed
- run this in your terminal
  
  ```
   git clone 'https://github.com/nizaralheet/Promix.git'
   cd Promix/
   chmod +x promix.sh
   ./promix.sh install
  ```

> ### ‼️ Important note ‼️  to apply new colors you should run :
>```
>./.local/share/icons/Promix/scripts/replace_script.sh
>```
> and you could add it to the commands of wpgtk to do it automatically after applying new wallpaper 
  
 ### for manual install 
- clone the repo then copy the Promix folder theme to `.local/share/icons`
- run wpgtk and add `~/.local/share/icons/Promix/scripts/replace_folder_file.sh`  as a template .
- edit the template file from wpgtk and copy `replace_folder_file.sh.base` from the cloned repo and paste it  there .
-  run `gtk-update-icon-cache -f -t ~/.local/share/icons/Promix/`
- enjoy
  
#### to uninstall 🫥  you could run this in the cloned repo 
  ```
  ./promix uninstall
  ```
