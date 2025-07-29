# Remove-folder.ps1
#
# Function: Remove-folder
#
# Contributors: @theDXT
# Created: 2024-12-19
# Last Modified: 2024-12-19
# Version 1.0.0
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
        Write-Verbose "Cleaned up folder: $FolderPath"
    } catch {
        Write-Verbose "Error cleaning up folder: $_"
        Exit 1
    }
}