# Create-PublicShortcut.ps1
#
# Function: Create-PublicShortcut
#
# Contributors: @kaysouthall, @theDXT
# Created: 2024-10-07
# Last Modified: 2024-10-07
# Version 1.0
#
# Description:
#   Creates a shortcut to the installed application in the location
#
# Parameters:
#   - ShortcutName <string>
#       Name of the application to create the shortcut for.
#
#   - TargetPath <string>
#       Path to the executable file of the application.
#

function Create-PublicShortcut {
    param (
        [string]$TargetPath,
        [string]$ShortcutName
    )
   
    $WshShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut("$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$ShortcutName.lnk")
    $Shortcut.TargetPath = $TargetPath
    $Shortcut.Save()
    Write-Verbose "Created public shortcut: $ShortcutName"
}