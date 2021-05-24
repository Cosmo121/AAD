$Credential = Get-Credential
Connect-AzureAD -Credential $Credential

<# 
Get all AzureAD Devices and export
Module: https://docs.microsoft.com/en-us/powershell/module/azuread/get-azureaddevice
#>
Get-AzureADDevice -All:$true | select-object -Property Enabled, DeviceId, DisplayName, DeviceTrustType, ApproximateLastLogonTimestamp | export-csv devicelist-summary.csv

# Get stale devices with custom time filter and export
$dt = [datetime]'2019/01/01'
Get-AzureADDevice | Where-Object {$_.ApproximateLastLogonTimeStamp -le $dt} | select-object -Property Enabled, DeviceId, DisplayName, DeviceTrustType, ApproximateLastLogonTimestamp | export-csv devicelist-olderthan-Jan-01-2019-summary.csv

# Get a specific device from its object-ID
Get-AzureADDevice -ObjectId "3cb87a8f-0a41-4ca8-8910-e56cc00114a3"

# Find a devices user
Get-AzureADDeviceRegisteredUser -ObjectID "3cb87a8f-0a41-4ca8-8910-e56cc00114a3"

# Remove and add a user to a device
Remove-AzureADDeviceRegisteredUser -ObjectID "3cb87a8f-0a41-4ca8-8910-e56cc00114a3"
Add-AzureADDeviceRegisteredUser -ObjectID "3cb87a8f-0a41-4ca8-8910-e56cc00114a3"
