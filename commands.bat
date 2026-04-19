for /r "music-on-github" %f in (*.mp3) do (
  ffmpeg -i "%f" -an -vcodec copy "..\ocarina\vids\%~nf.jpg"
)

for /r "music-on-github" %f in (*.mp3) do (
  ffmpeg -loop 1 -i "vids\%~nf.jpg" -i "%f" -c:v libx264 -tune stillimage -c:a copy -shortest "..\ocarina\videos\%~nf.mp4"
)

for /r "music-on-github" %f in (*.mp3) do (
  ffmpeg -loop 1 -i "vids\%~nf.jpg" -i "%f" -c:v libx264 -tune stillimage -c:a copy -shortest "..\ocarina\videos\%~nf.mkv"
)

for /r "music-on-github" %f in (*.mp3) do (
  ffmpeg -loop 1 -i "vids\%~nf.jpg" -i "%f" -c:v libx264 -pix_fmt yuv420p -movflags +faststart -tune stillimage -c:a copy -shortest "..\ocarina\videos\%~nf.mp4"
)