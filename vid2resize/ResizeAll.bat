@echo off
setlocal

REM ===== Réglages faciles =====
set "DIV=4"          REM facteur de division (2,3,4,...). 1 = pas de redimensionnement
set "CRF=20"         REM 18~20 = quasi transparent ; 23 = défaut x264 ; +haut = +petit/+moche
set "PRESET=fast"    REM ultrafast, superfast, veryfast, faster, fast, medium, slow, slower (plus lent = plus petit à qualité égale)
set "AUDIO_MODE=copy" REM copy = garde l'audio tel quel ; sinon ex: aac -b:a 128k

REM ===== Dossiers =====
set "BASE=%~dp0"
set "IN=%BASE%original"
set "OUT=%BASE%resized"

REM ===== Vérifs =====
where ffmpeg >nul 2>&1 || (echo [ERREUR] FFmpeg introuvable dans le PATH & pause & exit /b 1)
if not exist "%IN%" (echo [ERREUR] Dossier introuvable: "%IN%" & pause & exit /b 1)
if not exist "%OUT%" mkdir "%OUT%"

echo.
echo === Redimensionnement x%DIV% et recompression (CRF=%CRF%, preset=%PRESET%) ===
echo    Source : "%IN%"
echo    Sortie : "%OUT%"
echo.

REM Boucle sur plusieurs extensions courantes
for %%E in (mp4 MP4 mov MOV mkv MKV) do (
  for %%F in ("%IN%\*.%%E") do (
    if exist "%%~fF" (
      echo Traitement : %%~nxF
      if "%DIV%"=="1" (
        REM Pas de redimensionnement (DIV=1) : juste ré-encode (utile si tu veux standardiser le codec)
        if /I "%AUDIO_MODE%"=="copy" (
          ffmpeg -y -i "%%~fF" -c:v libx264 -crf %CRF% -preset %PRESET% -c:a copy "%OUT%\%%~nF.mp4"
        ) else (
          ffmpeg -y -i "%%~fF" -c:v libx264 -crf %CRF% -preset %PRESET% -c:a aac -b:a 128k "%OUT%\%%~nF.mp4"
        )
      ) else (
        REM Redimensionnement : dimensions paires + filtre propre (lanczos)
        if /I "%AUDIO_MODE%"=="copy" (
          ffmpeg -y -i "%%~fF" -vf "scale=trunc(iw/%DIV%/2)*2:trunc(ih/%DIV%/2)*2:flags=lanczos" -c:v libx264 -crf %CRF% -preset %PRESET% -c:a copy "%OUT%\%%~nF.mp4"
        ) else (
          ffmpeg -y -i "%%~fF" -vf "scale=trunc(iw/%DIV%/2)*2:trunc(ih/%DIV%/2)*2:flags=lanczos" -c:v libx264 -crf %CRF% -preset %PRESET% -c:a aac -b:a 128k "%OUT%\%%~nF.mp4"
        )
      )
      echo.
    )
  )
)

echo Fini ! Fichiers dans: "%OUT%"
pause
