#------------------------
#-kazukikasama Solutions-
#------------------------
#make dir in current user appdata
mkdir $Env:LOCALAPPDATA\yt-dlp-gui

#Download yt-dlp, ffmpeg and yt-dlp-gui from official sites current releases
Invoke-WebRequest https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe  -OutFile $Env:LOCALAPPDATA\yt-dlp-gui\yt-dlp.exe
Invoke-WebRequest https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -OutFile $Env:LOCALAPPDATA\yt-dlp-gui\ffmpeg.zip
Invoke-WebRequest https://github.com/kannagi0303/yt-dlp-gui/releases/latest/download/yt-dlp-gui.exe -OutFile $Env:LOCALAPPDATA\yt-dlp-gui\yt-dlp-gui.exe

#extract ffmpeg
Expand-Archive $Env:LOCALAPPDATA\yt-dlp-gui\ffmpeg.zip -DestinationPath $Env:LOCALAPPDATA\yt-dlp-gui\

#copy ffmpeg and delete dowloaded extra files
Copy-Item -Path "$Env:LOCALAPPDATA\yt-dlp-gui\ffmpeg-master-latest-win64-gpl\bin\*" -Destination "$Env:LOCALAPPDATA\yt-dlp-gui"
remove-item -fo $Env:LOCALAPPDATA\yt-dlp-gui\ffmpeg-master-latest-win64-gpl -recurse
remove-item -fo $Env:LOCALAPPDATA\yt-dlp-gui\ffmpeg.zip -recurse

#make shorcut in Destop
$desktop = [Environment]::GetFolderPath("Desktop")
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$desktop\Youtube Dowloader P.lnk")
$Shortcut.TargetPath="$Env:LOCALAPPDATA\yt-dlp-gui\yt-dlp-gui.exe"
$Shortcut.Arguments=""
$Shortcut.IconLocation="$Env:LOCALAPPDATA\yt-dlp-gui\yt-dlp-gui.exe"
$Shortcut.Save()

#make shorcut in Start Menu
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Env:APPDATA\Microsoft\Windows\Start Menu\Programs\Youtube Dowloader P.lnk")
$Shortcut.TargetPath="$Env:LOCALAPPDATA\yt-dlp-gui\yt-dlp-gui.exe"
$Shortcut.Arguments=""
$Shortcut.IconLocation="$Env:LOCALAPPDATA\yt-dlp-gui\yt-dlp-gui.exe"
$Shortcut.Save()


