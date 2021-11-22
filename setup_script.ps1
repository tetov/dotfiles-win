[Environment]::SetEnvironmentVariable("GIT_SSH", "C:\Users\tetov\scoop\apps\putty\current\PLINK.EXE", "User")

$DotFilesPath = "C:\Users\tetov\dotfiles"
$DotFilesAutodetect = $true
Install-Dotfiles
