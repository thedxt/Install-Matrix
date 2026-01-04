# Install-Office.ps1
#
# Function: Install-Office
#
# Contributors: @kaysouthall, @theDXT
# Created: 2024-Oct-07
# Last Modified: 2026-Jan-04
# Version 3.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
#   Executes the downloaded installer with specified arguments to perform a sillent installation.
#
# Parameters:
#   - InstallerPath <string>
#       The full path to the installer file to be executed.

# add the install args with a space and comobos it with the office XML
$FullInstallArgs = $InstallArgs +" " + $OfficeXML

function Install-Office {
    param (
        [string]$InstallerPath
    )
    
    try {
    Write-Host "Installation is starting"
       Start-Process $InstallerPath $FullInstallArgs -wait -WindowStyle Hidden

        Write-Host "Installation completed successfully"
    } catch {
        Write-Host "Error during installation: $_"
        Exit 1
    }

}
