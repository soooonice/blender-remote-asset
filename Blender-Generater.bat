
@echo off
setlocal
cd /d "%~dp0"

REM Select Blender.exe
set "BLENDER_EXE="

for /f "usebackq delims=" %%I in (`powershell -NoProfile -Command "Add-Type -AssemblyName System.Windows.Forms; $d = New-Object System.Windows.Forms.OpenFileDialog; $d.Title = 'Select Blender.exe'; $d.Filter = 'Blender (blender.exe)|blender.exe'; if ($d.ShowDialog() -eq 'OK') { Write-Output $d.FileName }"`) do (
    set "BLENDER_EXE=%%I"
)

REM Check selection
if not defined BLENDER_EXE (
    echo No Blender selected.
    pause
    exit /b 1
)

REM Run asset listing
"%BLENDER_EXE%" -b -c asset_listing generate .

pause
