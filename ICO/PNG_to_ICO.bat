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
  database
  design
  desktop
  downloads
  eye
  floppy
  folder
  folder_zipped
  fonts
  games
  globe
  home
  image
  library
  link
  lock
  magnet
  magnifier
  shortcuts
  star
  steam
  terminal
  text
  tools
  trash
  user
  users
  video
  windows
) do (
  REM absolute path is more performant
  "Y:\Software\Heavy\Multimedia\ImageMagick\magick.exe" convert "../PNG/%%x_16px.png" "../PNG/%%x_24px.png" "../PNG/%%x_32px.png" "../PNG/%%x_48px.png" "../PNG/%%x_256px.png" "%%x.ico"
)