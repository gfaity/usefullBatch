@echo off
Setlocal enabledelayedexpansion

Set "Pattern=charToRemove"
Set "Replace=charNew"

For %%# in ("C:\Users\username\Documents\*.ext") Do (
    Set "File=%%~nx#"
    Ren "%%#" "!File:%Pattern%=%Replace%!"
)

Pause&Exit

REM code from https://stackoverflow.com/questions/16128869/how-to-rename-file-by-replacing-substring-using-batch-in-windows