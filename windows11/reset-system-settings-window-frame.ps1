$path = "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\windows.immersivecontrolpanel_cw5n1h2txyewy\ApplicationFrame\windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel"

$values = $(
    "Positions"
    "PreferredMinSize"
)

#Get-ItemProperty "Registry::$path"

foreach ($value in $values) {
    Remove-ItemProperty "Registry::$path" -Name $value
}
