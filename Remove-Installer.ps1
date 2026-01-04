# Remove-Installer.ps1
#
# Function: Remove-Installer
#
# Contributors: @kaysouthall
# Created: 2024-Oct-07
# Last Modified: 2026-Jan-04
# Version 2.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
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
        Write-Host "Cleaned up installer file: $InstallerPath"
    } catch {
        Write-Host "Error cleaning up installer file: $_"
        Exit 1
    }

}
