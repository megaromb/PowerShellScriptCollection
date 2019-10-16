[CmdletBinding()]
param 
(
    [Parameter(Mandatory=$true)][string]$languageTagToRemove
)

$ErrorActionPreference = 'Stop'

$languageList = Get-WinUserLanguageList
$itemToRemove = $languageList | Where-Object LanguageTag -eq $languageTagToRemove

if ($null -ne $itemToRemove)
{
    $languageList.Remove($itemToRemove)
    Set-WinUserLanguageList $languageList -Force
   
    Write-Host "Language package ('$languageTagToRemove') has been successfully removed."
}
else 
{
    Write-Host "Language package ('$languageTagToRemove') not found in the languages installed."    
}
