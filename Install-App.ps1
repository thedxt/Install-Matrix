# Install-App.ps1
#
# Function: Install-App
#
# Contributors: @kaysouthall, @theDXT
# Created: 2024-10-07
# Last Modified: 2025-02-27
# Version 3.0.1
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
    Write-Verbose "Installation is starting"
       Start-Process $InstallerPath $InstallArgs -wait -WindowStyle Hidden

        Write-Verbose "Installation completed successfully"
    } catch {
        Write-Verbose "Error during installation: $_"
        Exit 1
    }
}
