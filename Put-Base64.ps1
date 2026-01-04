# Put-Base64.ps1
#
# Function: Put-Base64
#
# Contributors: @theDXT
# Created: 2024-Feb-13
# Last Modified: 2026-Jan-04
# Version 2.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
#   Places a Base64 item into a location.
#
# Parameters:
#   - Dest <string>
#       The full path of the base64 item.
#
#   - Base64 <string>
#       The base64 encoding of the item.

function Put-Base64{
param(
[Parameter (Mandatory = $true)] [String]$Dest,
[Parameter (Mandatory = $true)] [String]$Base64
)

    try {
        Write-Host "Placing Base64 item in: $Dest"
        $out = [Convert]::FromBase64String($Base64)
        [IO.File]::WriteAllBytes($Dest, $out)
        Write-Host "Base64 item placed"
    } catch {
        Write-Host "Error placing the Bas64 item: $_"
        Exit 1
    }


}
