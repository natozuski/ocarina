rem videos
rem in (root)

for /r "..\music-on-github" %f in (*.mp3) do (
  ffmpeg -n -i "%f" -an -vcodec copy "pics\%~nf.jpg"
)

for /r "..\music-on-github" %f in (*.mp3) do (
  ffmpeg -n -loop 1 -framerate 1 -i "pics\%~nf.jpg" -i "%f" -c:v libx264 -preset ultrafast -crf 30 -tune stillimage -pix_fmt yuv420p -movflags +faststart -c:a aac -b:a 192k -shortest "videos\%~nf.mp4"
)

rem youtube
rem in /youtube

for %f in (*.mp4) do ffmpeg -fflags +genpts -i "%f" -vf "scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2,fps=30" -c:v libx264 -preset medium -crf 20 -c:a aac -b:a 128k "720p\%~nf_720p.mp4"