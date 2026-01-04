# Extract.ps1
#
# Function: Extract
#
# Contributors: @theDXT
# Created: 2024-Dec-19
# Last Modified: 2026-Jan-04
# Version 1.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
#   extracts the specified zip and exports it to the specified output path.
#
# Parameters:
#   - ZipFile <string>
#       ZIP file to extract.
#
#   - OutputPath <string>
#       The full path to extract the zip to.

function Extract{
    param (
        [string]$ZipFile,
        [string]$OutputPath
    )
    try{
Write-host "Extracting zip"
Expand-Archive -force $ZipFile -DestinationPath $OutputPath
Write-host "zip is extracted to: $OutputPath"
} catch{
Write-host "Error extracting zip : $_"
        Exit 1
}

}

