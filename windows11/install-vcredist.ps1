# also https://www.techpowerup.com/download/visual-c-redistributable-runtime-package-all-in-one/

$packages = @(
    'Microsoft.VCRedist.2005.x86'
    'Microsoft.VCRedist.2005.x64'
    'Microsoft.VCRedist.2008.x86'
    'Microsoft.VCRedist.2008.x64'
    'Microsoft.VCRedist.2010.x86'
    'Microsoft.VCRedist.2010.x64'
    'Microsoft.VCRedist.2012.x86'
    'Microsoft.VCRedist.2012.x64'
    'Microsoft.VCRedist.2013.x86'
    'Microsoft.VCRedist.2013.x64'
    'Microsoft.VCRedist.2015+.x86'
    'Microsoft.VCRedist.2015+.x64'
)

foreach ($package in $packages) {
    winget install $package --silent
    #winget uninstall $package
}
