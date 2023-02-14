Automatic installer for [yt-dlp-gui](https://github.com/kannagi0303/yt-dlp-gui)
### Auto dowload Requirements for #yt-dlp-gui

-   [Yt-dlp](https://github.com/yt-dlp/yt-dlp)
-   [FFMPEG](https://ffmpeg.org/download.html#build-windows)
-  [Yt-dlp-gui](https://github.com/kannagi0303/yt-dlp-gui)
-  [Aria2](https://github.com/aria2/aria2)

yt-dlp-gui requires downloading and putting ffmpeg and yt-dlp.exe in the same or system folder, this script automates the process and creates shortcuts in the home folder and on the desktop as an installer
## how to use it?
**Method 1**
[save this link (right click save as)](https://raw.githubusercontent.com/kazukikasama/youtube-dlp-gui-installer/main/yt-dlp-gui-installer.ps1) 
when it has downloaded in windows file explorer right click run with PowerShell

**Method 2**
In windows start Menu, look for PowerShell, open it, paste the following link and press enter. In a minute it will be installed.
### Quick download link, is the same link but shortener
**Short Link**

    iwr -useb http://urlr.me/9yjwn|iex

**Long Link**
   

     iwr -useb https://raw.githubusercontent.com/kazukikasama/youtube-dlp-gui-installer/main/yt-dlp-gui-installer.ps1|iex

## For Uninstall
Paste in PowerShell short or long link
**short link**

    iwr -useb http://urlr.me/97zG6|iex

**Long Link**

    iwr -useb https://raw.githubusercontent.com/kazukikasama/youtube-dlp-gui-installer/main/yt-dlp-gui-uninstaller.ps1|iex

**Or**
[save this link (right click save as)](https://raw.githubusercontent.com/kazukikasama/youtube-dlp-gui-installer/main/yt-dlp-gui-uninstaller.ps1) when it has downloaded in windows file explorer right click run with PowerShell

**Or** 
Paste this code in PowerShell

    $desktop = [Environment]::GetFolderPath("Desktop")
    remove-item -fo $Env:LOCALAPPDATA\yt-dlp-gui -recurse
    remove-item -fo "$desktop\Youtube Dowloader P.lnk" -recurse
    remove-item -fo ("$Env:APPDATA\Microsoft\Windows\Start Menu\Programs\Youtube Dowloader P.lnk") -recurse
