#Requires -RunAsAdministrator

# https://support.microsoft.com/en-gb/topic/use-the-system-file-checker-tool-to-repair-missing-or-corrupted-system-files-79aa86cb-ca52-166a-92a3-966e85d4094e
# https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/clean-up-the-winsxs-folder?view=windows-11

Dism.exe /Online /Cleanup-Image /StartComponentCleanup #/ResetBase
Dism.exe /Online /Cleanup-Image /RestoreHealth

sfc /scannow

# AnalyzeComponentStore
