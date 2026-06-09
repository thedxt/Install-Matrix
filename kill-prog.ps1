# kill-prog.ps1
#
# Function: kill-prog
#
# Contributors: @theDXT
# Created: 2024-Oct-08
# Last Modified: 2026-Jun-09
# Version 1.2.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
# kills the running program
#
# Parameters:
#   -program: Program Description

function kill-prog{
    param (
        [string]$program
    )
write-host "Hunting for $program"
$kill = Get-Process | Where {$_.Description -eq $program}
if ($kill)
{
Write-host "$program is running"
#execute the kill
$kill | Stop-Process -force
Write-host "$program has been killed"
}else{
Write-host "$program is NOT running"
}
}
