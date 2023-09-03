cd $PSScriptRoot

$Project = Read-Host "Enter Project Name"
$Region = Read-Host "Enter AWS Region"
$Memory = Read-Host "Enter Desired Memory Allocation ie, 198"
$Timeout = Read-Host "Enter Lambda Timeout ie, 30"
$Dir = "./" +  "$Project"
$FileName = "$Project" + ".ps1"
$FilePath = "$Dir/$FileName"
$PublishName = "publish-" +"$Project" + ".ps1"
$PublishNameZip = "publish-" +"$Project" + ".zip"
$EditName = "edit-" + "$Project" + ".ps1"

mkdir $Project
mkdir $Project/resources

New-AWSPowerShellLambda -Directory $Project/$Project -ScriptName $Project -Template Basic

cd $Project

Write-Output "Publish-AWSPowerShellLambda -ScriptPath $FilePath -Name $Project -Region $Region -Memory $Memory -Timeout $Timeout" | Out-File $PublishName

Write-Output "New-AWSPowerShellLambdaPackage -ScriptPath $FilePath -OutputPackage $PublishNameZip" | Out-File $PublishName -Append

Write-Output "vi $FilePath" | Out-File $EditName

aws configure

