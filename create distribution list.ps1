# Date Created: 07/09/2020
# Written by: Bill Keefe
# Title: Create Distribution List
# Version: 1.0
#
# This script will create a new distribution list in Exchange Online.
# You must be connected to the Exchange Online Shell to use. 
#
####################################################################

#Connect to Exchange Online Shell
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking

    #End Region

#Get Distribution List Information
$Name = 'New List'
$PrimarySMTP = 'newlist@yourdomain.com'
$ManagedBy = 'owner@yourdomain.com'
$Members = 'person1@yourdomain.com','person2@yourdomain.com','person3@yourdomain.com','person4@yourdomain.com','person5@yourdomain.com'

    #End Region

#Create New Distribution List and Add Members
New-Mailbox -Shared -Name $Name -ModeratedBy $ManagedBy -PrimarySmtpAddress $PrimarySMTP

    #End Region

#Display Newly Created List and Members
Get-DistributionGroup $PrimarySMTP
Get-DistributionGroupMember $PrimarySMTP | Select-Object DisplayName
    
    #End Region

##End New Distribution Group Script

