# nuke-anaconda.ps1
#
# Function: nuke-anaconda
#
# Contributors: @theDXT
# Created: 2024-Jul-04
# Last Modified: 2026-Jan-04
# Version 2.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
#   perform a silent uninstall of Anaconda.
#

function nuke-anaconda {
  
  try {
  Write-Host "Uninstall is starting"
  $AnacondaFinder = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  | 
Get-ItemProperty | Where-Object {$_.Publisher -like "Anaconda, Inc*" }  | Select-Object -Property DisplayName, UninstallString

if ($AnacondaFinder){
write-Host "Anaconda IS detected"

$AnacondaNuke = $AnacondaFinder.UninstallString
$AnacondaNuke = $AnacondaNuke.Replace('"', '')
start-Process -Filepath $AnacondaNuke -ArgumentList "/S" -WindowStyle Hidden -wait


}else{
write-host "Anaconda is NOT detected"
}

      Write-Host "Uninstall completed successfully"
  } catch {
      Write-Host "Error during uninstall: $_"
      Exit 1
  }
}
