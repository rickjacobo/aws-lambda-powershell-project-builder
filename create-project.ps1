cd $PSScriptRoot
  
$Project = Read-Host "Enter Project Name"
$Region = Read-Host "Enter AWS Region"
$Memory = Read-Host "Enter Desired Memory Allocation ie, 198"
$Dir = "./" +  "$Project"
$FileName = "$Project" + ".ps1"
$FilePath = "$Dir/$FileName"

New-AWSPowerShellLambda -ScriptName $Project -Template Basic

Write-Output "Publish-AWSPowerShellLambda -ScriptPath $FilePath -Name $Project -Region $Region -Memory $Memory" | Out-File publish.ps1

Write-Output "vi $FilePath" | Out-File edit.ps1

aws configure
