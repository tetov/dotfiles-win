Import-Module 'C:\Users\tetov\scoop\apps\scoop\current\supporting\completion\Scoop-Completion.psd1' -ErrorAction SilentlyContinue

$DotFilesPath = "C:\Users\tetov\dotfiles"
$DotFilesAutodetect = $true

function gb() {
    & git branch $args
}

function gco() {
    & git checkout $args
}

function gr() {
    & git remote $args
}

function ga() {
    & git add $args
}

function gst() {
    & git status
}

function gc() {
    & git commit $args
}

function gcmsg() {
    & git commit -m $args
}

function v() {
    & nvim $args
}


#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& "C:\Users\tetov\miniforge3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion

