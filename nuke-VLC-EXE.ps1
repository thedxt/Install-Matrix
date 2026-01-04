# nuke-VLC-EXE.ps1
#
# Function: nuke-VLC-EXE
#
# Contributors: @theDXT
# Created: 2024-Mar-18
# Last Modified: 2026-Jan-04
# Version 2.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
#   perform a silent uninstall of VLC EXE.


function nuke-VLC-EXE{

$VLC_EXEFinder = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  | 
Get-ItemProperty | Where-Object {$_.DisplayName -like "VLC media*" -and $_.UninstallString -notlike "MsiExec.exe*"}| Select-Object -Property DisplayName, UninstallString


if (-not($VLC_EXEFinder))
{
write-host "VLC EXE Client NOT found"
}else{
write-host "VLC EXE Client Found"
write-host "VLC EXE Client Nuke is Starting"

ForEach ($VLC_version in $VLC_EXEFinder) {

    If ($VLC_version.UninstallString) {
        $VLC_exe_Nuke = $VLC_version.UninstallString
        $VLC_exe_Nuke = $VLC_exe_Nuke.Replace('"', '')
        start-Process -Filepath $VLC_exe_Nuke -ArgumentList "/S" -WindowStyle Hidden -wait
    }

}
write-host "VLC EXE Client Nuke is completed"
}


}
