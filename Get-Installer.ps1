# Get-Installer.ps1
#
# Function: Get-Installer
#
# Contributors: @kaysouthall
# Created: 2024-10-07
# Last Modified: 2024-10-07
# Version 2.0
#
# Description:
#   Downloads the installer from the specified URL and saves it to the specified output path.
#   Ensures that the temporary directory exists before downloading.
#
# Parameters:
#   - DownloadUrl <string>
#       URL to download the installer from.
#
#   - OutputPath <string>
#       The full path (including filename) to save the downloaded installer.

function Get-Installer {
    param (
        [string]$DownloadUrl,
        [string]$OutputPath
    )
    
    if (-Not (Test-Path -Path $TempDir)) {
        New-Item -ItemType Directory -Path $TempDir | Out-Null
        Write-Verbose "Created temporary directory: $TempDir"
    }

    try {
        Invoke-WebRequest -Uri $DownloadUrl -OutFile $OutputPath -ErrorAction Stop
        Write-Verbose "Downloaded installer to: $OutputPath"
    } catch {
        Write-Verbose "Error downloading installer: $_"
        Exit 1
    }
}