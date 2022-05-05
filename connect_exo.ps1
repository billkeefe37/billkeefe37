# Date Created: 06/25/2020
# Written by: Bill Keefe
# Title: Connect-Exo Function
# Version: 1.0
#
# This function allows easy connection to the Exchnage Online Shell
####################################################################

$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking
