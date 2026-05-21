rem videos
rem in (root)

for /r "..\music-on-github" %f in (*.mp3) do (
  ffmpeg -n -i "%f" -an -vcodec copy "pics\%~nf.jpg"
)

for /r "..\music-on-github" %f in (*.mp3) do (
  ffmpeg -n -loop 1 -framerate 1 -i "pics\%~nf.jpg" -i "%f" -c:v libx264 -preset ultrafast -crf 30 -tune stillimage -pix_fmt yuv420p -movflags +faststart -c:a aac -b:a 192k -shortest "videos\%~nf.mp4"
)