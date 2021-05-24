# Connect to Azure AD
$Credential = Get-Credential
Connect-AzureAD -Credential $Credential

<# 
    Module: https://docs.microsoft.com/en-us/powershell/module/azuread/get-azureaduser
#>

# Examples using get user
Get-AzureADUser -ObjectId "2ce10b15-cdff-4455-8402-7a9932b3bd54"

# Get a user's memberships
Get-AzureADUserMembership  -ObjectId "df19e8e6-2ad7-453e-87f5-037f6529ae16"


<#
Unlike on-prem AD, you must set an AAD user to never expire via PowerShell. This can be done below, along with manually changing the password to something of your creation, instead of it requring a change on first logon (default behavior). This is especially useful for service accounts created as AzureAD users.
#>
# Set user to never expire 
Set-AzureADUser -ObjectId "2ce10b15-cdff-4455-8402-7a9932b3bd54" -PasswordPolicies DisablePasswordExpiration
# Change Password
$password = ConvertTo-SecureString "myPassword" -AsPlainText -Force
Set-AzureADUserPassword -ObjectId "2ce10b15-cdff-4455-8402-7a9932b3bd54" -Password $password
