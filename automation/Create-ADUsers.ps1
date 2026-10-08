Import-Module ActiveDirectory

$CsvPath = "C:\AD-Automation\NewUsers.csv"
$TargetOU = "OU=Users,OU=AZATHOTH-LAB,DC=azathoth,DC=lab"
$TemporaryPassword = Read-Host "Enter the temporary password" -AsSecureString

$Users = Import-Csv -Path $CsvPath

foreach ($User in $Users) {
    $DisplayName = "$($User.FirstName) $($User.LastName)"

    $ExistingUser = Get-ADUser -Filter "SamAccountName -eq '$($User.Username)'" -ErrorAction SilentlyContinue

    if ($ExistingUser) {
        Write-Warning "$($User.Username) already exists. Skipping."
        continue
    }

    $Group = Get-ADGroup -Identity $User.Group -ErrorAction SilentlyContinue

    if (-not $Group) {
        Write-Warning "Group $($User.Group) was not found. Skipping $($User.Username)."
        continue
    }

    $UserParameters = @{
        Name                  = $DisplayName
        GivenName             = $User.FirstName
        Surname               = $User.LastName
        DisplayName           = $DisplayName
        SamAccountName        = $User.Username
        UserPrincipalName     = "$($User.Username)@azathoth.lab"
        Department            = $User.Department
        Path                  = $TargetOU
        AccountPassword       = $TemporaryPassword
        Enabled               = $true
        ChangePasswordAtLogon = $true
        PassThru              = $true
        ErrorAction           = "Stop"
    }

    try {
        $NewUser = New-ADUser @UserParameters

        Add-ADGroupMember -Identity $Group -Members $NewUser -ErrorAction Stop

        Write-Host "Created $DisplayName and added the account to $($User.Group)." -ForegroundColor Green
    }
    catch {
        Write-Error "Failed to create $DisplayName. $($_.Exception.Message)"
    }
}