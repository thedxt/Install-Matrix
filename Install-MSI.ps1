# Install-MSI.ps1
#
# Function: Install-MSI
#
# Contributors: @kaysouthall, @theDXT
# Created: 2024-10-07
# Last Modified: 2025-04-04
# Version 3.0.1
#
# Description:
#   Executes the downloaded MSI installer with specified arguments to perform a silent installation.
#
# Parameters:
#   - InstallerPath <string>
#       The full path to the MSI installer file to be executed.

function Install-MSI {
    param (
        [string]$InstallerPath
    )
    
    try {
    Write-Verbose "Installation is starting"
       Start-Process msiexec.exe -ArgumentList "/i" , $InstallerPath, $InstallArgs -wait -WindowStyle Hidden

        Write-Verbose "Installation completed successfully"
    } catch {
        Write-Verbose "Error during installation: $_"
        Exit 1
    }
}
