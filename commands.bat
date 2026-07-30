rem videos
rem in (root)
rem 

for /r "..\alpha_trion" %f in (*.mp3) do (
  ffmpeg -n -i "%f" -an -vcodec copy "pics\%~nf.jpg"
)

for /r "..\alpha_trion" %f in (*.mp3) do (
  ffmpeg -n -loop 1 -framerate 1 -i "pics\%~nf.jpg" -i "%f" -c:v libx264 -preset ultrafast -crf 30 -tune stillimage -pix_fmt yuv420p -movflags +faststart -c:a aac -b:a 192k -shortest "videos\%~nf.mp4"
)

for /r "..\primon_prime" %f in (*.mp3) do (
  ffmpeg -n -i "%f" -an -vcodec copy "pics\%~nf.jpg"
)

for /r "..\primon_prime" %f in (*.mp3) do (
  ffmpeg -n -loop 1 -framerate 1 -i "pics\%~nf.jpg" -i "%f" -c:v libx264 -preset ultrafast -crf 30 -tune stillimage -pix_fmt yuv420p -movflags +faststart -c:a aac -b:a 192k -shortest "videos\%~nf.mp4"
)

for /r "..\prima_prime" %f in (*.mp3) do (
  ffmpeg -n -i "%f" -an -vcodec copy "pics\%~nf.jpg"
)

for /r "..\prima_prime" %f in (*.mp3) do (
  ffmpeg -n -loop 1 -framerate 1 -i "pics\%~nf.jpg" -i "%f" -c:v libx264 -preset ultrafast -crf 30 -tune stillimage -pix_fmt yuv420p -movflags +faststart -c:a aac -b:a 192k -shortest "videos\%~nf.mp4"
)

rem
rem
rem make video into GIF
rem
rem

ffmpeg -ss 00:00:00.000 -t 00:00:00.000 -i input.mp4 -vf "fps=15,scale=640:-1:flags=lanczos" output.gif

rem resize images TEMPLATE
rem

ffmpeg -i input.png -vf scale=WIDTH:HEIGHT output.png
ffmpeg -i input.png -vf "scale='if(lt(iw,ih),3000,-1)':'if(lt(iw,ih),-1,3000)'" output.png

rem
rem for editing videos to work everywhere
rem
rem for windows thumbnails

ffmpeg -y ^
-i "input_unfixed.mp4" ^
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
"input.mp4"

ffmpeg -i "input.mp4" -i "thumbnail.jpg" ^
-map 0 -map 1 ^
-c copy ^
-c:v:1 png ^
-disposition:v:1 attached_pic ^
"output.mp4"