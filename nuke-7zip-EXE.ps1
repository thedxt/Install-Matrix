# nuke-7zip-EXE.ps1
#
# Function: nuke-7zip-EXE
#
# Contributors: @theDXT
# Created: 2024-Mar-22
# Last Modified: 2026-Jan-04
# Version 2.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
#   perform a silent uninstall of 7Zip EXE.


function nuke-7zip-EXE{

$7ZipEXEFinder = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  | 
Get-ItemProperty | Where-Object {$_.DisplayName -like "7-Zip*" -and $_.UninstallString -notlike "MsiExec.exe*"} | Select-Object -Property DisplayName, UninstallString

# test if 7Zip exe was found if found remove it
if (-not($7ZipEXEFinder))
{
write-host "7Zip EXE Client NOT found"
}else{
write-host "7Zip EXE Client Found"
write-host "7Zip EXE Client Nuke is Starting"

ForEach ($7Zip_exe_version in $7ZipEXEFinder) {

    If ($7Zip_exe_version.UninstallString) {
        $7Zip_exe_Nuke = $7Zip_exe_version.UninstallString
        $7Zip_exe_Nuke = $7Zip_exe_Nuke.Replace('"', '')
        start-Process -wait -Filepath $7Zip_exe_Nuke -ArgumentList "/S" -WindowStyle Hidden
    }

}
write-host "7Zip EXE Client Nuke is completed"
}


}
