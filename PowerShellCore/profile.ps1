#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& "C:\Users\tetov\scoop\apps\miniconda3\current\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion

Import-Module 'C:\Users\tetov\scoop\apps\scoop\current\supporting\completion\Scoop-Completion.psd1' -ErrorAction SilentlyContinue

$DotFilesPath = "C:\Users\tetov\dotfiles"
$DotFilesAutodetect = $true
