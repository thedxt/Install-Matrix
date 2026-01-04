# nuke-VLC-MSI.ps1
#
# Function: nuke-VLC-MSI
#
# Contributors: @theDXT
# Created: 2024-Mar-18
# Last Modified: 2026-Jan-04
# Version 2.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
#   perform a silent uninstall of VLC MSI.


function nuke-VLC-MSI{

$VLC_MSIFinder = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  | 
Get-ItemProperty | Where-Object {$_.DisplayName -like "VLC media*" -and $_.UninstallString -like "MsiExec.exe*"}| Select-Object -Property DisplayName, PSChildName


if (-not($VLC_MSIFinder))
{
write-host "VLC MSI Client NOT found"
}else{
write-host "VLC MSI Client Found"
write-host "VLC MSI Client Nuke is Starting"

ForEach ($VLC_version in $VLC_MSIFinder) {

    If ($VLC_version.PSChildName) {
        $VLC_version = $VLC_version.PSChildName
        start-Process msiexec.exe -ArgumentList "/x", "$VLC_version", "/qn", "/norestart" -WindowStyle Hidden -wait
    }

}
write-host "VLC MSI Client Nuke is completed"
}


}
