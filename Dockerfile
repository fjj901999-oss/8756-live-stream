FROM alpine:3.18
RUN apk update && apk add --no-cache ffmpeg
WORKDIR /app
COPY thumbnail.jpg .
COPY music.mp3 .
CMD ffmpeg -dead_one_shot_timeout 10000000 -stream_loop -1 -loop 1 -i thumbnail.jpg -i music.mp3 -vcodec libx264 -pix_fmt yuv420p -maxrate 2048k -bufsize 4096k -g 60 -acodec aac -b:a 128k -ar 44100 -f flv "rtmp://://youtube.com{YOUTUBE_STREAM_KEY}"
