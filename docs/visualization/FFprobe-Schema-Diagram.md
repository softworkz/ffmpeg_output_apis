# FFprobe Schema Diagram

## FFprobe Schema Diagram

```mermaid
---
config:
  curve: stepAfter
  er:
    layout: elk
    diagramPadding: 2
    entityPadding: 12
    rankSpacing: 50
    nodeSpacing: 50
  themeCSS:
    - '.er.entityBox { fill: orange; rx: 5; ry: 5; stroke-width: 1px !important;      stroke: #e9e9e9 !important;      fill: url(#ff-filtergradient) !important;      filter: drop-shadow(0px 0px 5.5px rgba(0, 0, 0, 0.15));  fill: white !important;  } '
    - '.entityLabel { fill: #33333394;  } '
    - 'g  .entityLabel:first-of-type {
        font-size: 0.75rem !important;   
        font-weight: 600 !important;   
        text-transform: uppercase;
        min-width: 5.5rem;
        fill: #33333394 !important; 
        margin-bottom: 0.1rem; } '
    - '.attributeBoxEven, .attributeBoxOdd {
        fill: transparent; 
        stroke: #dfdfdf;
        filter: drop-shadow(0px 0px 2.2px rgba(0, 0, 0, 0.15));
        stroke-width: 0.4; rx: 2; ry: 2;
        clip-path: fill-box; } '
    - >-
      path.er.relationshipLine { marker-end: none !important; marker-start: none
      !important;  stroke: gray;      stroke-width: 1;      fill: none;     
      filter: drop-shadow(0px 0px 9px rgba(0, 0, 0, 0.5));  } 
    - null
  theme: default
---
erDiagram

  chapter {
      int end 
      int id 
      string time_base 
      int start 
      string start_time 
      string end_time 
  }


  chapter ||--|| chapter_tags : ""

  chapter_tags {
      string title 
  }



  chapters {
  }


  chapters ||--o{ chapter : ""

  error {
  }



  format {
      string filename 
      int nb_streams 
      int nb_programs 
      int nb_stream_groups 
      string format_name 
      string format_long_name 
      string start_time 
      string duration 
      string size 
      string bit_rate 
      int probe_score 
  }


  format ||--|| format_tags : ""

  format_tags {
      string ENCODER 
  }



  frame {
      int key_frame 
      int channels 
      int pts 
      string pts_time 
      string pix_fmt 
      string pkt_dts_time 
      string media_type 
      int duration 
      string channel_layout 
      int crop_bottom 
      string duration_time 
      int stream_index 
      int interlaced_frame 
      int height 
      int crop_top 
      int width 
      string pict_type 
      string color_primaries 
      string pkt_dts 
      int best_effort_timestamp 
      int top_field_first 
      string pkt_pos 
      string pkt_size 
      int crop_right 
      string color_range 
      string sample_fmt 
      int repeat_pict 
      int crop_left 
      int nb_samples 
      string best_effort_timestamp_time 
      string sample_aspect_ratio 
      string color_space 
      string color_transfer 
      string chroma_location 
  }


  frame ||--|| frame_tags : ""
  frame ||--|| frame_side_data_list : ""
  frame ||--|| logs : ""

  frames {
  }


  frames ||--o{ frame : ""
  frames ||--o{ subtitle : ""

  frame_tags {
  }



  frame_side_data_list {
  }


  frame_side_data_list ||--o{ frame_side_data : ""

  frame_side_data {
      string side_data_type 
  }


  frame_side_data ||--|| timecodes : ""
  frame_side_data ||--|| frame_side_data_components : ""

  timecodes {
  }


  timecodes ||--o{ timecode : ""

  timecode {
  }



  frame_side_data_components {
  }


  frame_side_data_components ||--o{ frame_side_data_component : ""

  frame_side_data_component {
  }


  frame_side_data_component ||--|| frame_side_data_pieces : ""

  frame_side_data_pieces {
  }


  frame_side_data_pieces ||--o{ frame_side_data_piece : ""

  frame_side_data_piece {
  }



  log {
  }



  logs {
  }


  logs ||--o{ log : ""

  library_version {
      int micro 
      int version 
      string name 
      int major 
      int minor 
      string ident 
  }



  library_versions {
  }


  library_versions ||--o{ library_version : ""

  packet {
      int duration 
      string duration_time 
      string size 
      string pos 
      string codec_type 
      int stream_index 
      int pts 
      string pts_time 
      int dts 
      string dts_time 
      string flags 
  }


  packet ||--|| packet_tags : ""
  packet ||--|| packet_side_data_list : ""

  packet_tags {
  }



  packets {
  }


  packets ||--o{ packet : ""

  packets_and_frames {
  }


  packets_and_frames ||--o{ packet : ""

  packet_side_data_list {
  }


  packet_side_data_list ||--o{ packet_side_data : ""

  packet_side_data {
  }



  pixel_format {
      string log2_chroma_w 
      string log2_chroma_h 
      string name 
      int nb_components 
      int bits_per_pixel 
  }


  pixel_format ||--|| pixel_format_flags : ""
  pixel_format ||--|| pixel_format_components : ""

  pixel_format_flags {
      int big_endian 
      int palette 
      int bitstream 
      int hwaccel 
      int planar 
      int rgb 
      int alpha 
  }



  component {
      int index 
      int bit_depth 
  }



  pixel_format_components {
  }


  pixel_format_components ||--o{ component : ""

  pixel_formats {
  }


  pixel_formats ||--o{ pixel_format : ""

  program_stream_disposition {
  }



  program_stream_tags {
  }



  program {
  }


  program ||--|| program_tags : ""
  program ||--|| program_streams : ""

  program_streams {
  }


  program_streams ||--o{ program_stream : ""

  program_stream {
  }


  program_stream ||--|| program_stream_disposition : ""
  program_stream ||--|| program_stream_tags : ""

  program_tags {
  }



  program_version {
      string version 
      string copyright 
      string compiler_ident 
      string configuration 
  }



  programs {
  }


  programs ||--o{ program : ""


  root {
  }


  root ||--|| chapters : ""
  root ||--|| format : ""
  root ||--|| frames : ""
  root ||--|| programs : ""
  root ||--|| streams : ""
  root ||--|| packets : ""
  root ||--|| error : ""
  root ||--|| program_version : ""
  root ||--|| library_versions : ""
  root ||--|| pixel_formats : ""

  stream {
      string bits_per_raw_sample 
      string duration 
      string bit_rate 
      string max_bit_rate 
      string nb_read_packets 
      string nb_frames 
      string nb_read_frames 
      string codec_long_name 
      string profile 
      int coded_width 
      int coded_height 
      int closed_captions 
      int film_grain 
      int has_b_frames 
      string sample_aspect_ratio 
      string display_aspect_ratio 
      string pix_fmt 
      int level 
      string color_range 
      string color_space 
      string color_transfer 
      string color_primaries 
      string chroma_location 
      string field_order 
      int refs 
      string is_avc 
      string nal_length_size 
      int bits_per_sample 
      int initial_padding 
      string codec_type 
      string codec_tag_string 
      string codec_tag 
      int width 
      int height 
      string id 
      string r_frame_rate 
      string avg_frame_rate 
      string time_base 
      int start_pts 
      string start_time 
      int duration_ts 
      int index 
      string codec_name 
      string sample_fmt 
      string sample_rate 
      int channels 
      string channel_layout 
      int extradata_size 
  }


  stream ||--|| stream_disposition : ""
  stream ||--|| stream_tags : ""
  stream ||--|| stream_side_data_list : ""

  stream_disposition {
      int timed_thumbnails 
      int non_diegetic 
      int captions 
      int descriptions 
      int metadata 
      int dependent 
      int still_image 
      int default 
      int dub 
      int original 
      int comment 
      int lyrics 
      int karaoke 
      int forced 
      int hearing_impaired 
      int visual_impaired 
      int clean_effects 
      int attached_pic 
      int multilayer 
  }



  streams {
  }


  streams ||--o{ stream : ""

  stream_tags {
      string language 
      string DURATION 
  }



  stream_side_data_list {
  }


  stream_side_data_list ||--o{ stream_side_data : ""

  stream_side_data {
  }



  subtitle {
  }



```

### Command Line

```
ffmpeg ...something with print_schema or similar-..
```
