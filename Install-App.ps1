# Install-App.ps1
#
# Function: Install-App
#
# Contributors: @kaysouthall, @theDXT
# Created: 2024-Oct-07
# Last Modified: 2026-Jan-04
# Version 3.0.2
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
#   Executes the downloaded installer with specified arguments to perform a silent installation.
#
# Parameters:
#   - InstallerPath <string>
#       The full path to the installer file to be executed.

function Install-App {
    param (
        [string]$InstallerPath
    )
    
    try {
    Write-Host "Installation is starting"
       Start-Process $InstallerPath $InstallArgs -wait -WindowStyle Hidden

        Write-Host "Installation completed successfully"
    } catch {
        Write-Host "Error during installation: $_"
        Exit 1
    }
}


