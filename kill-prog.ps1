# kill-prog.ps1
#
# Function: kill-prog
#
# Contributors: @theDXT
# Created: 2024-Oct-08
# Last Modified: 2026-Jan-04
# Version 1.0.1
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
Get-Process | Where {$_.Description -eq $program} | Stop-Process -force

}
