# Prog-Finder.ps1
#
# Contributors: @theDXT
# Created: 2023-Apr-16
# Last Modified: 2026-Jan-04
# Version 2.1.1
#
# Looks for a currently installed program.
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Usage:
#   .\Prog-Finder.ps1 -ProgramName "Duo Authentication"

 function Prog-Finder {
	     param (
		 [Parameter(Mandatory=$true)]
        [string]$ProgramName
    )
 $RegKeys = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -like "*$ProgramName*"}
if ($RegKeys)
{
write-host "$ProgramName is Found"
$CurentVersion = $RegKeys.DisplayVersion
write-host "$ProgramName version is $CurentVersion"
}else{
write-host "$ProgramName is NOT Found"
}
}
