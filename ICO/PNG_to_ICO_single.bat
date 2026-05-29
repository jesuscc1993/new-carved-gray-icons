@echo off

:loop
set /p x="Enter the name of the file to convert (extension excluded): "
magick.exe convert "../PNG/%x%_16.png" "../PNG/%x%_24.png" "../PNG/%x%_32.png" "../PNG/%x%_48.png" "../PNG/%x%_256.png" "%x%.ico"
echo Successfully generated %x%.ico
echo.

goto loop
