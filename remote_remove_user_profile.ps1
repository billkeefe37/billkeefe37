# remote_remove_user_profile.ps1
# Written by Bill Keefe
# 05/03/2021
# Version 1.2
#
# This script is to used to remove off-boarded
# user profiles on remote PCs. This is
# only to be used with the intention of clearing hard drive space.
#
# THIS MUST BE PERFORMED AS AN ADMIN!!
#
##################################################################


$computer = "PCNAME12345"
$users = 'person1','person2','person3','person5','person6','person7'

### View Profiles of target PC####

Get-WmiObject -Class Win32_UserProfile -Computer $computer | Where-Object {$_.Special -ne 'Special'} | Select-Object LocalPath

    #End Region#

### Remove Profile from target PC. BE SURE THE PROFILE IS ELIGIBLE FOR DELETION!!!###

foreach($user in $users) {Get-WmiObject -ComputerName $computer -Class Win32_UserProfile -Filter "localpath='C:\\Users\\$user'" | Remove-WmiObject }

    #End Region#

### Verify Free Space on the Target PC ###

Get-WmiObject Win32_LogicalDisk -ComputerName $computer -Filter DriveType=3 | Select-Object DeviceID, @{'Name'='Size (GB)'; 'Expression'={[math]::truncate($_.size / 1GB)}}, @{'Name'='Freespace (GB)'; 'Expression'={[math]::truncate($_.freespace / 1GB)}}

    #End Region#

#End Script#