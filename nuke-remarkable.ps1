# nuke-remarkable.ps1
#
# Function: nuke-remarkable
#
# Contributors: @theDXT
# Created: 2024-Nov-05
# Last Modified: 2026-Jan-04
# Version 1.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
#   Uninstalls reMarkable 32 bit or 64 bit
#
# Parameters:
#   none

function nuke-remarkable{

$remark_64_Nuke = "C:\Program Files\reMarkable\maintenancetool.exe"

$remark_32_Nuke = "C:\Program Files (x86)\reMarkable\maintenancetool.exe"

$remark_Nuke = "-c purge"



if (Test-Path -Path $remark_64_Nuke) {
        Write-host "found 64 Bit reMarkable"
        Write-host "Nuking 64 Bit reMarkable"
        Start-Process -FilePath $remark_64_Nuke -ArgumentList $remark_Nuke -Wait -WindowStyle Hidden
        Write-Host "removed 64 Bit reMarkable"
        }else{
        Write-host "did NOT find 64 Bit reMarkable"
        }

if (Test-Path -Path $remark_32_Nuke) {
        Write-host "found 32 Bit reMarkable"
        Write-host "Nuking 32 Bit reMarkable"
        Start-Process -FilePath $remark_32_Nuke -ArgumentList $remark_Nuke -Wait -WindowStyle Hidden
        Write-host "removed 32 Bit reMarkable"
        }else{
        Write-host "did NOT find 32 Bit reMarkable"
        }


}
