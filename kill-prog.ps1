# kill-prog.ps1
#
# Function: kill-prog
#
# Contributors: @theDXT
# Created: 2024-10-08
# Last Modified: 2024-10-08
# Version 1.0.0
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