# Date Created: 05/05/2022
# Written by: Bill Keefe
# Title: Create Shared Mailbox
# Version: 1.0
#
# This script will create a new Shared Mailbox in Exchange Online.
# You must be connected to the Exchange Online Shell to use. 
#
####################################################################

#Connect to the Exchange Online Shell
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking

    #End Region

#Enter Shared Mailbox Information
$Name = 'New Shared Mailbox'
$Alias = 'newsharedmailbox'
$PrimarySMTP = 'newsharedmailbox@yourdomain.com'
$Owner = 'owner@yourdomain.com'
$Members = 'person1@yourdomain.com', 'person2@yourdomain.com','person3@yourdomain.com','person4@yourdomain.com','person5@yourdomain.com'

    #End Region

#Create New Shared Mailbox
New-Mailbox -Shared -Name $Name -DisplayName $Name -Alias $Alias -PrimarySmtpAddress $PrimarySMTP

   #End Region

#Add Members to Shared Mailbox with FullAccess Permission and AutoMapping set to $True
foreach ($member in $Members) {Add-MailboxPermission -Identity  $PrimarySMTP -User $member -AccessRights FullAccess -AutoMapping $True}

   #End Region

####OPTIONAL#####
#Add SendAs Permissions to shared Mailbox
foreach ($member in $Members) {Add-RecipientPermission -Identity $PrimarySMTP -AccessRights SendAs -Trustee $member}

####OPTIONAL#####
#Set Owner of Shared Mailbox
Add-MailboxPermission -Identity $PrimarySMTP -Owner $Owner

    #End Region

###END SCRIPT