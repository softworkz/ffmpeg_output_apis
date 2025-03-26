
%FFBIN_PATH% -noauto_conversion_filters -print_graphs_file %OUTPUT_FILE% -print_graphs_format %OUTPUT_FORMAT% %EXTRA_ARGUMENTS% -i %MEDIA_PATH%video_1.mkv -i %MEDIA_PATH%video_1.en.srt -i %MEDIA_PATH%video_1.de.ssa -map 0:0 -c:v copy -map 0:1 -c:a:0 copy -map 0:2 -c:a:1 copy -map 0:7 -c:s:0 dvbsub -map 1:0 -c:s:1 ass -map 2:0 -c:s:2 copy -y  temp.mkv
