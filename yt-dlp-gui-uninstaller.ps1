$desktop = [Environment]::GetFolderPath("Desktop")
remove-item -fo $Env:LOCALAPPDATA\yt-dlp-gui -recurse
remove-item -fo "$desktop\Youtube Dowloader P.lnk" -recurse
remove-item -fo ("$Env:APPDATA\Microsoft\Windows\Start Menu\Programs\Youtube Dowloader P.lnk") -recurse