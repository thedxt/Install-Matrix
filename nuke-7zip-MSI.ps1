# nuke-7zip-MSI.ps1
#
# Function: nuke-7zip-MSI
#
# Contributors: @theDXT
# Created: 2024-Mar-22
# Last Modified: 2024-03-22
# Version 2.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
#   perform a silent uninstall of 7Zip MSI.


function nuke-7zip-MSI{

$7ZipMSIFinder = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  | 
Get-ItemProperty | Where-Object {$_.DisplayName -like "7-Zip*" -and $_.UninstallString -like "MsiExec.exe*"} | Select-Object -Property DisplayName, PSChildName

# test if 7Zip msi was found if found remove it
if (-not($7ZipMSIFinder))
{
write-host "7Zip MSI Client NOT found"
}else{
write-host "7Zip MSI Client Found"
write-host "7Zip MSI Client Nuke is Starting"

ForEach ($7Zip_msi_version in $7ZipMSIFinder) {

    If ($7Zip_msi_version.PSChildName) {
        $7Zip_msi_version = $7Zip_msi_version.PSChildName
        start-Process -wait msiexec.exe -ArgumentList "/x", "$7Zip_msi_version", "/qn" , "/norestart" -WindowStyle Hidden
    }

}
write-host "7Zip MSI Client Nuke is completed"
}


}
