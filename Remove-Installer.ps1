# Remove-Installer.ps1
#
# Function: Remove-Installer
#
# Contributors: @kaysouthall
# Created: 2024-10-07
# Last Modified: 2024-10-07
# Version 2.0
#
# Description:
#   Removes the downloaded installer file after installation.
#
# Parameters:
#   - InstallerPath <string>
#       The full path to the installer file to be removed.

function Remove-Installer {
    param (
        [string]$InstallerPath
    )

    try {
        Remove-Item -Path $InstallerPath -ErrorAction Stop
        Write-Verbose "Cleaned up installer file: $InstallerPath"
    } catch {
        Write-Verbose "Error cleaning up installer file: $_"
        Exit 1
    }
}