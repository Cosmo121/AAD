# Note: Must be ran on the Azure AD Connect Server, or through PSSession

Import-Module ADSync

Start-ADSyncSyncCycle -PolicyType Delta
