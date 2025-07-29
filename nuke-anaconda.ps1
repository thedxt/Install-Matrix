# nuke-anaconda.ps1
#
# Function: nuke-anaconda
#
# Contributors: @theDXT
# Created: 2024-07-04
# Last Modified: 2025-02-28
# Version 2.0.0
# Description:
#   perform a silent uninstall of Anaconda.
#

function nuke-anaconda {
  
  try {
  Write-Verbose "Uninstall is starting"
  $AnacondaFinder = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  | 
Get-ItemProperty | Where-Object {$_.Publisher -like "Anaconda, Inc*" }  | Select-Object -Property DisplayName, UninstallString

if ($AnacondaFinder){
write-verbose "Anaconda IS detected"

$AnacondaNuke = $AnacondaFinder.UninstallString
$AnacondaNuke = $AnacondaNuke.Replace('"', '')
start-Process -Filepath $AnacondaNuke -ArgumentList "/S" -WindowStyle Hidden -wait


}else{
write-verbose "Anaconda is NOT detected"
}

      Write-Verbose "Uninstall completed successfully"
  } catch {
      Write-Verbose "Error during uninstall: $_"
      Exit 1
  }
}