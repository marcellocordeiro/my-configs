# SM-S911B (ZTO)

from subprocess import run

appsToUninstall = [
    "com.facebook.appmanager",  # Facebook
    "com.facebook.katana",  # Facebook
    "com.facebook.services",  # Facebook
    "com.facebook.system",  # Facebook

    # "br.org.sidi.appsbrasil",  # Apps Brasil
    # "flipboard.boxer.app",  # Flipboard Briefing
    # "com.linkedin.android",  # LinkedIn
    # "com.microsoft.office.excel",  # Microsoft Excel
    # "com.microsoft.office.powerpoint",  # Microsoft PowerPoint
    # "com.microsoft.office.word",  # Microsoft Word
    "com.microsoft.skydrive",  # Microsoft OneDrive
    "com.swiftkey.swiftkeyconfigurator", # Microsoft SwiftKey Factory Settings
    "com.touchtype.swiftkey", # Microsoft SwiftKey Keyboard

    "com.android.chrome",  # Google Chrome
    "com.google.android.apps.tachyon",  # Google Duo
    # "com.google.ar.core",  # Google AR Core
    "com.google.android.projection.gearhead",  # Android Auto
    # "com.google.android.youtube",  # YouTube

    # "com.samsung.android.rubin.app", # Samsung Customization Service
    # "com.samsung.android.app.spage", # Samsung Free
    # "com.samsung.android.livestickers", # Deco Pic
    # "com.samsung.android.smartswitchassistant",  # Smart Switch assistant
    # "com.sec.android.easyMover.Agent",  # Smart Switch Agent
    # "com.samsung.android.kidsinstaller" # Kids Installer
]

appsToDisable = [
    # "com.sec.android.widgetapp.samsungapps",  # Samsung Apps Widget
    # "com.samsung.android.aremoji",  # AR Emoji
    # "com.diotek.sec.lookup.dictionary",  # Dictionary
    # "com.google.android.as",  # Device Personalization Services
    # "com.sec.android.usermanual",  # User Manual
    # "com.sec.android.app.dexonpc",  # DeX for PC
    "com.android.providers.partnerbookmarks",  # Partner Bookmarks
    "com.sec.android.app.chromecustomizations", # ChromeCustomizations

    "com.google.android.googlequicksearchbox",  # Google App
    "com.android.hotwordenrollment.xgoogle", # Google Assistant
    "com.android.hotwordenrollment.okgoogle", # Google Assistant   

    "com.microsoft.appmanager", # Link to Windows
    "com.samsung.android.mdx", # Link to Windows Service
]

systemAppsToDisable = [
    # "com.sec.spp.push",  # Push Service
    "com.samsung.android.game.gamehome",  # Game Launcher
]

bixby = [
    # "com.samsung.android.bixby.wakeup",
    # "com.samsung.android.bixby.service",
    # "com.samsung.android.bixby.agent",
    # "com.samsung.android.bixby.agent.dummy",
    # "com.samsung.android.visionintelligence",
]

samsungPay = [
    # "com.samsung.android.samsungpassautofill",
    # "com.samsung.android.authfw",
    # "com.samsung.android.samsungpass",
    # "com.samsung.android.spay",
    # "com.samsung.android.spayfw",
]

arStuff = [
    # "com.samsung.android.aremoji",
    # "com.samsung.android.arzone",
    # "com.samsung.android.visionarapps",
    # "com.samsung.android.ardrawing",
]

cleanSetup = [
    # "com.google.android.apps.docs", # Google Drive
    # "com.google.android.apps.maps", # Google Maps
    # "com.google.android.gm", # Gmail
]

uninstallCommand = ["adb", "shell", "pm", "uninstall", "--user", "0"]
disableCommand = ["adb", "shell", "pm", "disable-user", "--user", "0"]
clearDataCommand = ["adb", "shell", "pm", "clear"]
installExistingCommand = ["adb", "shell", "cmd", "package", "install-existing"]

for app in appsToUninstall + bixby + samsungPay + arStuff:
    run(clearDataCommand + [app])
    run(uninstallCommand + [app])

for app in appsToDisable + systemAppsToDisable:
    run(clearDataCommand + [app])
    run(disableCommand + [app])

for app in []:
    run(installExistingCommand + [app])

# To delete data
# adb shell pm clear {app}

# To disable only
# adb shell pm disable-user --user 0 {app}

# To reenable
# adb shell pm enable {app}

# To reinstall
# adb shell cmd package install-existing {app}

"""extra = [
    "com.samsung.android.mdx",  # Link to Windows Service
    "com.microsoft.appmanager",  # Your Phone Companion (Link to Windows)
    "com.samsung.android.scloud",  # Samsung Cloud
    "com.samsung.android.smartswitchassistant",  # Smart Switch assistant
    "com.sec.android.easyMover.Agent",  # Smart Switch Agent
    "com.sec.android.app.fm",  # FM Radio
    "com.dsi.ant.service.socket  ",  # --ANT Radio Service
    "com.dsi.ant.sample.acquirechannels",  # --ANT + DUT
    "com.dsi.ant.plugins.antplus",  # ANT+ Plugins Service
    "com.dsi.ant.server",  # --ANT+ HAL service
]"""
 
# adb shell pm list packages | grep app
 