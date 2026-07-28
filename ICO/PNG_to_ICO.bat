@echo off

for %%x in (
  adult
  arcade
  archive
  asterisk
  audio
  book
  books
  camera
  cd
  chrome
  clock
  cloud
  cog
  cog_alt
  comic
  computer
  cube
  database
  design
  desktop
  downloads
  downloads_alt
  eye
  floppy
  folder
  folder_zipped
  fonts
  games
  globe
  home
  image
  important
  library
  link
  lock
  lock_open
  magnet
  magnifier
  palette
  python
  shortcuts
  star
  steam
  terminal
  text
  tools
  trash
  tv
  user
  users
  video
  windows
) do (
  REM absolute path is more performant
  magick convert "../PNG/%%x_16.png" "../PNG/%%x_24.png" "../PNG/%%x_32.png" "../PNG/%%x_48.png" "../PNG/%%x_256.png" "%%x.ico"
)
set /p x="Press enter to exit..."
