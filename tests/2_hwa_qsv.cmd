
%FFBIN_PATH% -print_graphs_file %OUTPUT_FILE% -print_graphs_format %OUTPUT_FORMAT% %EXTRA_ARGUMENTS% -init_hw_device d3d11va=d1:2 -init_hw_device qsv@d1 -hwaccel qsv -c:v h264_qsv -i %MEDIA_PATH%video_1.mkv -filter_complex "[0:0]scale_qsv=w=512:h=256[f1_out0]" -af "aecho,volume" -map [f1_out0] -map 0:1 -map s:0 -c:s:0 dvbsub -map s:4 -c:s:1 copy -c:v hevc_qsv -y  temp.mkv
