![Image](https://github.com/user-attachments/assets/ddaee1d2-b8ff-46ee-83ba-959c95ec91fe)
# Install Matrix
The Install Matrix is a collection of PowerShell install functions as scripts.
The goal of the Install Matrix is to modularize each part of a PowerShell install script into functions that can be reused in new PowerShell scripts to install applications.
The Install Matrix helps reduce duplicate work, making it quick and easy to package applications and reducing overhead when updating them.

# The Scripts
## Backup-App-Data.ps1
This script looks for the defined `AppData` folder for each user account in `C:\Users` and, if found, copies it to a new folder in `AppData` with the current data and time.
> [!NOTE]
>  The backed-up data can be restored using the `Restore-App-Data.ps1` script.

## Create-PublicShortcut.ps1
This script creates a public Start Menu shortcut for an application.

## Extract.ps1
This script extracts the specified zip and exports it to the specified output path.

## Get-FileNameFromUrl.ps1
This script gets the file name from the get-finalurl function.
> [!IMPORTANT]
> The script depends on the `Get-FinalUrl.ps1` function to work.

## Get-FinalUrl.ps1
This script gets the final URL after redirections.

## Get-Installer.ps1
This script downloads the installer from the specified URL, saves it to the specified output path, and ensures that the temporary directory exists before downloading.

## Install-App.ps1
This script executes the downloaded installer with specified arguments to perform a silent installation.
> [!IMPORTANT]
> Use this with EXEs.

## Install-MSI.ps1
This script executes the downloaded MSI installer with specified arguments to perform a silent installation.
> [!IMPORTANT]
> Use this with MSIs.

## Install-Office.ps1
This script added the option to load an Office XML deployment file using the variable `$OfficeXML` with the Office installer.

## Prog-Finder.ps1
This script will find a 32-bit or 64-bit installed application and output the version.

## Put-Base64.ps1
This script places a Base64 item into a specified location.

## Remove-Installer.ps1
This script removes the downloaded installer file. The script should be executed after the program installation is completed.

## Remove-folder.ps1
This script removes a folder and all its contents. The script should be executed after the program installation is completed.

## Restore-App-Data.ps1
This script looks for the defined `AppData` backup created by the `Backup-App-Data.ps1` script for each user account in `C:\Users`, and if found, restores it to the same location. If the folder does not exist, it creates the folder first. It uses force to make sure the backup is restored.
> [!IMPORTANT]
> This script has only been tested with `AppData` backups from the `Backup-App-Data.ps1` script.

## kill-prog.ps1
This script kills the specified running program.

## nuke-7zip-EXE.ps1
This script performs a silent uninstall of 7Zip EXE.

## nuke-7zip-MSI.ps1
This script performs a silent uninstall of 7Zip MSI.

## nuke-VLC-EXE.ps1
This script performs a silent uninstall of VLC EXE.

## nuke-VLC-MSI.ps1
This script performs a silent uninstall of VLC MSI.

## nuke-anaconda.ps1
This script performs a silent uninstall of Anaconda.

## nuke-remarkable.ps1
This script silently uninstalls reMarkable 32-bit or 64-bit
