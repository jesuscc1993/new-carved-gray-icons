@echo off

for %%x in (
  adult
  archive
  asterisk
  audio
  camera
  cd
  chrome
  clock
  cloud
  cog
  comic
  design
  desktop
  downloads
  eye
  floppy
  folder
  fonts
  games
  home
  image
  library
  lock
  magnifier
  shortcuts
  star
  steam
  terminal
  text
  tools
  user
  video
  windows
) do (  
  "Z:\Software\Heavy\Multimedia\ImageMagick\magick.exe" convert "../PNG/%%x_16px.png" "../PNG/%%x_24px.png" "../PNG/%%x_32px.png" "../PNG/%%x_48px.png" "../PNG/%%x_256px.png" "%%x.ico"
)