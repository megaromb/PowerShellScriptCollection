$ErrorActionPreference = "Stop"

$shell = New-Object -ComObject "WScript.Shell"
$shell.Popup("Safely unplug your external monitor and click OK to continue.", 0, "Clearing External Monitor Cache", 0)

try {
    Remove-Item -Path HKLM:\System\CurrentControlSet\Control\GraphicsDrivers\Connectivity -Recurse
    Remove-Item -Path HKLM:\System\CurrentControlSet\Control\GraphicsDrivers\Configuration -Recurse

    $shell.Popup("External monitor cache has been cleared.", 0, "Clearing External Monitor Cache", 0)
}
    
catch {
    $shell.Popup("ERROR message: $_", 0, "Clearing External Monitor Cache", 0)
}
