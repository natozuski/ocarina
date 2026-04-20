rem for /r "music-on-github" %f in (*.mp3) do (
rem   ffmpeg -i "%f" -an -vcodec copy "..\ocarina\vids\%~nf.jpg"
rem )

rem for /r "music-on-github" %f in (*.mp3) do (
rem   ffmpeg -loop 1 -i "vids\%~nf.jpg" -i "%f" -c:v libx264 -tune stillimage -c:a copy -shortest "..\ocarina\videos\%~nf.mp4"
rem )

rem for /r "music-on-github" %f in (*.mp3) do (
rem   ffmpeg -loop 1 -i "vids\%~nf.jpg" -i "%f" -c:v libx264 -tune stillimage -c:a copy -shortest "..\ocarina\videos\%~nf.mkv"
rem )

rem for /r "music-on-github" %f in (*.mp3) do (
rem   ffmpeg -loop 1 -i "vids\%~nf.jpg" -i "%f" -c:v libx264 -pix_fmt yuv420p -movflags +faststart -tune stillimage -c:a copy -shortest "..\ocarina\videos\%~nf.mp4"
rem )

rem for /r "..\music-on-github" %f in (*.mp3) do (
rem   ffmpeg -loop 1 -i "vids\%~nf.jpg" -i "%f" -c:v libx264 -pix_fmt yuv420p -movflags +faststart -tune stillimage -c:a copy -shortest "..\ocarina\videos\%~nf.mp4"
rem )



rem in ocarina

for /r "..\music-on-github" %f in (*.mp3) do (
  ffmpeg -n -i "%f" -an -vcodec copy "vids\%~nf.jpg"
)

for /r "..\music-on-github" %f in (*.mp3) do (
  ffmpeg -n -loop 1 -i "vids\%~nf.jpg" -i "%f" -c:v libx264 -pix_fmt yuv420p -movflags +faststart -tune stillimage -c:a copy -shortest "videos\%~nf.mp4"
)