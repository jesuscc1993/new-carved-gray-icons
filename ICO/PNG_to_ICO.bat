@echo off

for %%x in (
  adult
  arcade
  archive
  asterisk
  audio
  book
  camera
  cd
  chrome
  clock
  cloud
  cog
  comic
  computer
  cube
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
  trash
  user
  video
  windows
) do (  
  "Z:\Software\Heavy\Multimedia\ImageMagick\magick.exe" convert "../PNG/%%x_16px.png" "../PNG/%%x_24px.png" "../PNG/%%x_32px.png" "../PNG/%%x_48px.png" "../PNG/%%x_256px.png" "%%x.ico"
)