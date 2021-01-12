cd $PSScriptRoot

$Project = Read-Host "Enter Project Name"
$Region = Read-Host "Enter AWS Region"
$Memory = Read-Host "Enter Desired Memory Allocation ie, 198"
$Dir = "./" +  "$Project"
$FileName = "$Project" + ".ps1"
$FilePath = "$Dir/$FileName"
$PublishName = "publish-" +"$Project" + ".ps1"
$EditName = "edit-" + "$Project" + ".ps1"

mkdir $Project

New-AWSPowerShellLambda -Directory $Project/$Project -ScriptName $Project -Template Basic

cd $Project

Write-Output "Publish-AWSPowerShellLambda -ScriptPath $FilePath -Name $Project -Region $Region -Memory $Memory" | Out-File $PublishName

Write-Output "vi $FilePath" | Out-File $EditName

aws configure

