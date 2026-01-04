# Remove-folder.ps1
#
# Function: Remove-folder
#
# Contributors: @theDXT
# Created: 2024-12-19
# Last Modified: 2026-Jan-04
# Version 1.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
#   Removes the folder and everything in it

# Parameters:
#   - FolderPath <string>
#       The full path to the folder to be removed.

function Remove-folder {
    param (
        [string]$FolderPath
    )

    try {
        Remove-Item -Path $FolderPath -Recurse -ErrorAction Stop
        Write-Host "Cleaned up folder: $FolderPath"
    } catch {
        Write-Host "Error cleaning up folder: $_"
        Exit 1
    }

}
