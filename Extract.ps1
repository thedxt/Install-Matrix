# Extract.ps1
#
# Function: Extract
#
# Contributors: @theDXT
# Created: 2024-12-19
# Last Modified: 2024-12-19
# Version 1.0.0
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
Write-verbose "Extracting zip"
Expand-Archive -force $ZipFile -DestinationPath $OutputPath
Write-verbose "zip is extracted to: $OutputPath"
} catch{
Write-Verbose "Error extracting zip : $_"
        Exit 1
}
}