[CmdletBinding()]
param 
(
    [Parameter(Mandatory=$true)][string]$languageTagToAdd
)

$ErrorActionPreference = 'Stop'

$languageList = Get-WinUserLanguageList
$itemToAdd = $languageList | Where-Object LanguageTag -eq $languageTagToAdd

if ($null -eq $itemToAdd)
{
    $languageList.Add($languageTagToAdd)
    Set-WinUserLanguageList $languageList -Force
   
    Write-Host "Language package ('$languageTagToAdd') has been successfully added."
}
else 
{
    Write-Host "Language package ('$languageTagToAdd') was already installed."    
}
