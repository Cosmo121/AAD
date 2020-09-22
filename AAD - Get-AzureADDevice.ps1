$Credential = Get-Credential
Connect-AzureAD -Credential $Credential

# Get all AzureAD Devices and export
Get-AzureADDevice -All:$true | select-object -Property Enabled, DeviceId, DisplayName, DeviceTrustType, ApproximateLastLogonTimestamp | export-csv devicelist-summary.csv

# Get stales devices with custom time filter and export
$dt = [datetime]’2019/01/01’
Get-AzureADDevice | Where-Object {$_.ApproximateLastLogonTimeStamp -le $dt} | select-object -Property Enabled, DeviceId, DisplayName, DeviceTrustType, ApproximateLastLogonTimestamp | export-csv devicelist-olderthan-Jan-01-2019-summary.csv