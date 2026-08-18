# SM-S911B (ZTO)

from subprocess import run

appsToUninstall = [
    "com.facebook.appmanager",  # Facebook
    "com.facebook.katana",  # Facebook
    "com.facebook.services",  # Facebook
    "com.facebook.system",  # Facebook
    "com.microsoft.appmanager",  # Link to Windows
    "com.microsoft.skydrive",  # Microsoft OneDrive
    "com.touchtype.swiftkey",  # Microsoft SwiftKey Keyboard
    "com.swiftkey.swiftkeyconfigurator",  # Microsoft SwiftKey Factory Settings
    "com.android.chrome",  # Google Chrome
    "com.google.android.apps.tachyon",  # Google Duo
    "com.google.android.apps.bard",  # Gemini
    "com.google.android.apps.photos",  # Photos
    "com.google.android.googlequicksearchbox",  # Google
    "com.google.android.videos",  # Google TV
    "com.sidia.suframa.notification",  # SuframaNotification (Amazonia toast after a reboot)
    #"com.samsung.android.messaging",  # Samsung Messages
    #"com.samsung.android.bixby.agent",  # Bixby
    #"com.sec.android.mimage.avatarstickers",  # Avatar Stickers
    #"com.samsung.android.aremoji",  # Galaxy Avatar
    "com.sec.android.usermanual",  # User Manual
]

appsToDisable = [
    # "com.android.providers.partnerbookmarks",  # Partner Bookmarks
    # "com.sec.android.app.chromecustomizations", # ChromeCustomizations
    # "com.google.android.as",  # Device Personalization Services
    # "com.android.hotwordenrollment.xgoogle",  # Google Assistant
    # "com.android.hotwordenrollment.okgoogle",  # Google Assistant
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
    "com.google.android.apps.docs",  # Google Drive
    "com.google.android.apps.maps",  # Google Maps
    "com.google.android.gm",  # Gmail
    "com.google.android.youtube",  # YouTube
    "com.google.android.apps.youtube.music",  # YouTube Music
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

# adb shell pm list packages | grep app
