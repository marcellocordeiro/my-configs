$userPackages = @(
    'Microsoft.WindowsCalculator'
    'Microsoft.WindowsCamera'
    'Microsoft.Copilot'
    'MicrosoftCorporationII.MicrosoftFamily'
    'Microsoft.WindowsFeedbackHub'
    'Microsoft.ZuneMusic'
    'Microsoft.MicrosoftOfficeHub'
    'Microsoft.BingSearch'
    'Clipchamp.Clipchamp'
    'Microsoft.BingNews'
    'MSTeams'
    'Microsoft.Todos'
    'Microsoft.OutlookForWindows'
    'Microsoft.Paint'
    'Microsoft.PowerAutomateDesktop'
    'MicrosoftCorporationII.QuickAssist'
    'Microsoft.ScreenSketch'
    'Microsoft.MicrosoftSolitaireCollection'
    'Microsoft.WindowsSoundRecorder'
    'Microsoft.MicrosoftStickyNotes'
    'Microsoft.BingWeather'
    'Microsoft.WindowsAlarms'
    'Microsoft.GamingApp'
    'Microsoft.Xbox.TCUI'
)

$systemPackages = @(
    'Microsoft.YourPhone'
    'MicrosoftWindows.CrossDevice'
    'Microsoft.Windows.DevHome'
    'MicrosoftWindows.Client.WebExperience'
    'Microsoft.WidgetsPlatformRuntime'
)

function Uninstall-Packages($packages) {
    foreach ($package in $packages) {
        #"package: [$package]"
        $manifest = Get-AppxPackage $package | Get-AppxPackageManifest
        $displayName = $manifest.Package.Properties.DisplayName
        # Get-AppxPackage $package
        "Uninstalling $displayName"
        Get-AppxPackage -Name $package | Remove-AppxPackage
    }
}

Uninstall-Packages $($userPackages; $systemPackages)

# get-appxpackage | Foreach {$($_.Name)}
# todo: remove optional features from System (internet explorer, windows media player legacy, etc) and more (net, media features etc)
