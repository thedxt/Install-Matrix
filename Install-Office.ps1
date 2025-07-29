# Install-Office.ps1
#
# Function: Install-Office
#
# Contributors: @kaysouthall, @theDXT
# Created: 2024-10-07
# Last Modified: 2025-01-06
# Version 3.0
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
    Write-Verbose "Installation is starting"
       Start-Process $InstallerPath $FullInstallArgs -wait -WindowStyle Hidden

        Write-Verbose "Installation completed successfully"
    } catch {
        Write-Verbose "Error during installation: $_"
        Exit 1
    }
}