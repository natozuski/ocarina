rem videos
rem in (root)

for /r "..\music-on-github" %f in (*.mp3) do (
  ffmpeg -n -i "%f" -an -vcodec copy "pics\%~nf.jpg"
)

for /r "..\music-on-github" %f in (*.mp3) do (
  ffmpeg -n -loop 1 -framerate 1 -i "pics\%~nf.jpg" -i "%f" -c:v libx264 -preset ultrafast -crf 30 -tune stillimage -pix_fmt yuv420p -movflags +faststart -c:a aac -b:a 192k -shortest "videos\%~nf.mp4"
)

rem thumbnails

ffmpeg -i input.mp4 -i thumbnail.png ^
  -map 0 -map 1 ^
  -c copy ^
  -c:v:1 png ^
  -disposition:v:1 attached_pic ^
  output.mp4

rem for editing videos to work everywhere

ffmpeg -y ^
-i "input.mp4" ^
-c:v libx264 ^
-profile:v high ^
-level 4.1 ^
-pix_fmt yuv420p ^
-r 30 ^
-g 60 ^
-keyint_min 60 ^
-sc_threshold 0 ^
-crf 18 ^
-preset medium ^
-movflags +faststart ^
-fflags +genpts ^
-avoid_negative_ts make_zero ^
-c:a aac ^
-b:a 192k ^
-ar 48000 ^
-ac 2 ^
"input_fixed.mp4"