from shlex import split
from subprocess import run


def runCommand(command):
    run(split(command))


appsToUninstall = [
    "br.org.sidi.appsbrasil",  # Apps Brasil
    "com.facebook.appmanager",  # Facebook
    "com.facebook.katana",  # Facebook
    "com.facebook.services",  # Facebook
    "com.facebook.system",  # Facebook
    "flipboard.boxer.app",  # Flipboard Briefing
    "com.linkedin.android",  # LinkedIn
    "com.microsoft.office.excel",  # Microsoft Excel
    "com.microsoft.office.powerpoint",  # Microsoft PowerPoint
    "com.microsoft.office.word",  # Microsoft Word
    "com.microsoft.skydrive",  # Microsoft OneDrive
    "com.google.android.googlequicksearchbox",  # Google App
    "com.android.chrome",  # Google Chrome
    "com.google.android.apps.tachyon",  # Google Duo
    "com.google.ar.core",  # Google AR Core
    "com.google.android.projection.gearhead",  # Android Auto
    "com.google.android.youtube",  # YouTube
]

appsToDisable = [
    "com.sec.android.widgetapp.samsungapps",  # Samsung Apps Widget
    "com.samsung.android.aremoji",  # AR Emoji
    "com.diotek.sec.lookup.dictionary",  # Dictionary
    "com.google.android.as",  # Device Personalization Services
    "com.sec.android.usermanual",  # User Manual
    "com.sec.android.app.dexonpc",  # DeX for PC
    "com.android.providers.partnerbookmarks",  # Partner Bookmarks
]

systemAppsToDisable = [
    "com.sec.spp.push",  # Push Service
    "com.samsung.android.game.gamehome",  # Game Launcher
]

bixby = [
    "com.samsung.android.bixby.wakeup",
    "com.samsung.android.bixby.service",
    "com.samsung.android.bixby.agent",
    "com.samsung.android.bixby.agent.dummy",
    "com.samsung.android.visionintelligence",
]

samsungPay = [
    "com.samsung.android.samsungpassautofill",
    "com.samsung.android.authfw",
    "com.samsung.android.samsungpass",
    "com.samsung.android.spay",
    "com.samsung.android.spayfw",
]

arStuff = [
    "com.samsung.android.aremoji",
    "com.samsung.android.arzone",
    "com.samsung.android.visionarapps",
    "com.samsung.android.ardrawing",
]

for app in appsToUninstall + bixby + samsungPay + arStuff:
    command = f"adb shell pm uninstall --user 0 {app}"
    runCommand(command)


for app in appsToDisable + systemAppsToDisable:
    command = f"adb shell pm clear {app}"
    runCommand(command)
    command = f"adb shell pm disable-user --user 0 {app}"
    runCommand(command)

for app in []:
    command = f"adb shell cmd package install-existing {app}"
    runCommand(command)

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
