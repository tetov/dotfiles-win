[Environment]::SetEnvironmentVariable("GIT_SSH", "C:\Users\tetov\scoop\apps\putty\current\PLINK.EXE", "User")

$DotFilesPath = "C:\Users\tetov\dotfiles"
$DotFilesAutodetect = $true
Install-Dotfiles

md ~\AppData\Local\nvim\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\AppData\Local\nvim\autoload\plug.vim"
  )
)
