@echo off

set /p x="Enter the name of the file to convert (extension excluded): "
"Y:\Software\Heavy\Multimedia\ImageMagick\magick.exe" convert "../PNG/%x%_16px.png" "../PNG/%x%_24px.png" "../PNG/%x%_32px.png" "../PNG/%x%_48px.png" "../PNG/%x%_256px.png" "%x%.ico"
set /p x="Successfully generated %x%.ico. Press enter to exit."
