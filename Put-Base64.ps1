# Put-Base64.ps1
#
# Function: Put-Base64
#
# Contributors: @theDXT
# Created: 2024-02-13
# Last Modified: 2025-01-07
# Version 2.0.0
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
        Write-Verbose "Placing Base64 item in: $Dest"
        $out = [Convert]::FromBase64String($Base64)
        [IO.File]::WriteAllBytes($Dest, $out)
        Write-Verbose "Base64 item placed"
    } catch {
        Write-Verbose "Error placing the Bas64 item: $_"
        Exit 1
    }

}