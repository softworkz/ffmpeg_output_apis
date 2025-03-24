# 2 Filtering and QSV HW Acceleration
## 2 Filtering and QSV HW Acceleration

```mermaid
%%{init: {"theme": "base","curve": "stepAfter","rankSpacing": 10,"nodeSpacing": 10,"themeCSS": ".root { --ff-colvideo: #6eaa7b; --ff-colaudio: #477fb3; --ff-colsubtitle: #ad76ab; --ff-coltext: #666; } .cluster span { color: var(--ff-coltext); } .node.ff-filter rect { rx: 10; ry: 10; stroke-width: 1px; stroke: #d3d3d3; fill:url(#ff-filtergradient); filter: drop-shadow(1px 1px 2px rgba(0, 0, 0, 0.1));} .node.ff-decoder rect, .node.ff-encoder rect { stroke-width: 1px; stroke: #d3d3d3; fill:url(#ff-filtergradient); filter: drop-shadow(1px 1px 2px rgba(0, 0, 0, 0.1));} .node.ff-inputfile .label foreignObject, .node.ff-outputfile .label foreignObject { overflow: visible; } .cluster.ff-inputfile .cluster-label foreignObject div:not(foreignObject div div), .cluster.ff-outputfile .cluster-label foreignObject div:not(foreignObject div div) { display: table !important; } .nodeLabel div.ff-inputfile, .nodeLabel div.ff-outputfile { font-size: 1.1rem; font-weight: 500; min-width: 14rem; width: 100%; display: flex; color: var(--ff-coltext); margin-top: 0.1rem; line-height: 1.35; padding-bottom: 1.9rem; } .nodeLabel div.ff-outputfile { flex-direction: row-reverse; } .ff-inputfile .index, .ff-outputfile .index { order: 2; color: var(--ff-coltext); text-align: center; border-radius: 0.45rem; border: 0.18em solid #666666db; font-weight: 600; padding: 0 0.3em; opacity: 0.8; } .ff-inputfile .index::before { content: \'In \'; } .ff-outputfile .index::before { content: \'Out \'; } .ff-inputfile .demuxer_name, .ff-outputfile .muxer_name { flex: 1; order: 1; font-size: 0.9rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; text-align: center; max-width: 8rem; align-content: center; margin: 0.2rem 0.4rem 0 0.4rem } .ff-inputfile .file_extension, .ff-outputfile .file_extension { order: 0; background-color: #888; color: white; text-align: center; border-radius: 0.45rem; font-weight: 600; padding: 0 0.4em; align-content: center; opacity: 0.8; } .ff-inputfile .url, .ff-outputfile .url { order: 4; text-align: center; position: absolute; left: 0; right: 0; bottom:0.75rem; font-size: 0.7rem; font-weight: 400; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; margin: 0 0.3rem; direction: rtl; color: #999; } .node.ff-inputstream rect, .node.ff-outputstream rect { padding: 0 !important; margin: 0 !important; border: none !important; fill: #fcfcfc; stroke: #e5e5e5 !important; height: 2.7rem; transform: translateY(0.2rem); filter: none; rx: 3; ry: 3;} .node.ff-inputstream .label foreignObject, .node.ff-outputstream .label foreignObject { transform: translateY(-0.2%); overflow: visible; } .node.ff-inputstream .label foreignObject div:not(foreignObject div div), .node.ff-outputstream .label foreignObject div:not(foreignObject div div) { display: block !important; line-height: 1.5 !important; } .nodeLabel div.ff-inputstream, .nodeLabel div.ff-outputstream { font-size: 1.0rem; font-weight: 500; min-width: 12rem; width: 100%; display: flex; } .nodeLabel div.ff-outputstream { flex-direction: row-reverse; } .ff-inputstream .name, .ff-outputstream .name { flex: 1; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; text-align: left; align-content: center; margin-bottom: -0.15rem; } .ff-inputstream .index, .ff-outputstream .index { flex: 0 0 1.4rem; background-color: #888; color: white; text-align: center; border-radius: 0.3rem; font-weight: 600; margin-right: -0.3rem; margin-left: 0.4rem; opacity: 0.8; } .ff-outputstream .index { margin-right: 0.6rem; margin-left: -0.4rem; } .ff-inputstream::before, .ff-outputstream::before { font-variant-emoji: text; flex: 0 0 2rem; margin-left: -0.8rem; margin-right: 0.2rem; } .ff-outputstream::before { margin-left: 0.2rem; margin-right: -0.6rem; } .ff-inputstream.video::before, .ff-outputstream.video::before { content: \'\\239A\'; color: var(--ff-colvideo); font-size: 2.25rem; line-height: 0.5; font-weight: bold; } .ff-inputstream.audio::before, .ff-outputstream.audio::before { content: \'\\1F39D\'; color: var(--ff-colaudio); font-size: 1.75rem; line-height: 0.9; } .ff-inputstream.subtitle::before, .ff-outputstream.subtitle::before { content: \'\\1AC\'; color: var(--ff-colsubtitle); font-size: 1.2rem; line-height: 1.1; transform: scaleX(1.5); margin-top: 0.050rem; } .ff-inputstream.attachment::before, .ff-outputstream.attachment::before { content: \'\\1F4CE\'; font-size: 1.3rem; line-height: 1.15; } .ff-inputstream.data::before, .ff-outputstream.data::before { content: \'\\27E8\\2219\\2219\\2219\\27E9\'; font-size: 1.15rem; line-height: 1.17; letter-spacing: -0.3px; } path.flowchart-link[id|=\'video\'] { stroke: var(--ff-colvideo); } path.flowchart-link[id|=\'audio\'] { stroke: var(--ff-colaudio); } path.flowchart-link[id|=\'subtitle\'] { stroke: var(--ff-colsubtitle); } marker.marker path { fill: context-stroke; } .edgeLabel foreignObject { transform: translateY(-1rem); } .edgeLabel p { background: transparent; white-space: nowrap; margin: 1rem 0.5rem !important; font-weight: 500; color: var(--ff-coltext); } .edgeLabel, .labelBkg { background: transparent;} .edgeLabels .edgeLabel *{ font-size: 0.8rem;} .node.ff-filter .label foreignObject { transform: translateY(-0.4rem); overflow: visible; } .nodeLabel div.ff-filter { font-size: 1.0rem; font-weight: 500; text-transform: uppercase; min-width: 5.5rem; margin-bottom: 0.5rem; } .nodeLabel div.ff-filter span { color: inherit; } .ff-inputfiles rect, .ff-outputfiles rect, .ff-inputstreams rect, .ff-outputstreams rect, .ff-decoders rect, .ff-encoders rect { stroke-width: 0; stroke: transparent; filter: none !important; fill: transparent !important; display: none !important; } .cluster rect { stroke: #dfdfdf !important; transform: translateY(-2.3rem); filter: drop-shadow( 1px 2px 2px rgba(185,185,185,0.2)) !important; rx: 8; ry: 8; } .cluster.ff-inputfile rect, .cluster.ff-outputfile rect { transform: translateY(-1.8rem); } .cluster.ff-filters rect { stroke-dasharray: 6 !important; stroke-width: 1.3px; stroke: #d1d1d1 !important; filter: none !important; } .cluster-label { font-size: 1.1rem; } .cluster-label .nodeLabel { display: block; font-weight: 500; color: var(--ff-coltext); } .cluster-label div { max-width: unset !important; padding: 3px; } .cluster.ff-filters div.ff-filters .id { display: none; } .cluster.ff-filters div.ff-filters .name { margin-right: 0.5rem; font-size: 0.9rem; } .cluster.ff-filters div.ff-filters .description { font-weight: 400; font-size: 0.75rem; vertical-align: middle; color: #777;     font-family: Cascadia Code, Lucida Console, monospace; } .nodeLabel div.ff-decoder, .nodeLabel div.ff-encoder { font-size: 0.85rem; font-weight: 500; min-width: 3.5rem; } .cluster-label foreignObject { transform: translateY(-0.7rem); } ","fontFamily": "Roboto,Segoe UI,sans-serif","themeVariables": { "clusterBkg": "white", "primaryBorderColor": "gray", "lineColor": "gray", "secondaryTextColor": "gray", "tertiaryBorderColor": "gray", "primaryTextColor": "#666", "secondaryTextColor": "red" },"flowchart": { "subGraphTitleMargin": { "top": -15, "bottom": 20 }, "diagramPadding": 20, "curve": "stepAfter" } }}%%

flowchart LR
  gradient_def@{ shape: text, label: "<svg xmlns="http://www.w3.org/2000/svg" width="1" height="1"><defs><linearGradient id="ff-filtergradient" x1="0%" y1="0%" x2="0%" y2="100%"><stop offset="0%" style="stop-color:hsla(0, 0%, 30%, 0.02);"/><stop offset="50%" style="stop-color:hsla(0, 0%, 30%, 0);"/><stop offset="100%" style="stop-color:hsla(0, 0%, 30%, 0.05);"/></linearGradient></defs></svg>" }

  subgraph Graph_0_0["<div class="ff-filters"><span class="name">Graph 0.0</span><span class="description">[0:0]scale_qsv=w=512:h=256[f1_out0]</span><span class="id">Graph_0_0</span></div>"]

    G0_Parsed_scale_qsv_0("<div class="ff-filter"><span class="filter_name">scale_qsv</span></div>"):::ff-filter

    G0_format("<div class="ff-filter"><span class="filter_name">format</span></div>"):::ff-filter
  end
  class Graph_0_0 ff-filters

  in_0_0 == "<span>qsv | nv12</span><br><span>1920x800</span><br><span>1:1</span><br>&nbsp;<br>&nbsp;<br>&nbsp;" ==> G0_Parsed_scale_qsv_0
  G0_Parsed_scale_qsv_0 == "<span>qsv | nv12</span><br><span>512x256</span><br><span>1:1</span><br>&nbsp;<br>&nbsp;<br>&nbsp;" ==> G0_format
  G0_format == "<span>qsv | nv12</span><br><span>512x256</span><br><span>1:1</span><br>&nbsp;<br>&nbsp;<br>&nbsp;" ==> out__0_0

  subgraph Graph_1_-1["<div class="ff-filters"><span class="name">Graph 1.-1</span><span class="description">aecho,volume</span><span class="id">Graph_1_-1</span></div>"]

    G1_Parsed_aecho_0("<div class="ff-filter"><span class="filter_name">aecho</span></div>"):::ff-filter

    G1_Parsed_volume_1("<div class="ff-filter"><span class="filter_name">volume</span></div>"):::ff-filter

    G1_format_out__0_1("<div class="ff-filter"><span class="filter_name">aformat</span></div>"):::ff-filter

    G1_auto_aresample_0("<div class="ff-filter"><span class="filter_name">aresample</span></div>"):::ff-filter
  end
  class Graph_1_-1 ff-filters

  in_0_1 == "<span>7.1</span><br><span>8 ch</span><br><span>48.1 kHz</span><br>&nbsp;<br>&nbsp;<br>&nbsp;" ==> G1_Parsed_aecho_0
  G1_Parsed_aecho_0 == "<span>7.1</span><br><span>8 ch</span><br><span>48.1 kHz</span><br>&nbsp;<br>&nbsp;<br>&nbsp;" ==> G1_auto_aresample_0
  G1_auto_aresample_0 == "<span>7.1</span><br><span>8 ch</span><br><span>48.1 kHz</span><br>&nbsp;<br>&nbsp;<br>&nbsp;" ==> G1_Parsed_volume_1
  G1_Parsed_volume_1 == "<span>7.1</span><br><span>8 ch</span><br><span>48.1 kHz</span><br>&nbsp;<br>&nbsp;<br>&nbsp;" ==> G1_format_out__0_1
  G1_format_out__0_1 == "<span>7.1</span><br><span>8 ch</span><br><span>48.1 kHz</span><br>&nbsp;<br>&nbsp;<br>&nbsp;" ==> out__0_1


  subgraph G2_Inputs["<div class="ff-inputfiles"></div>"]

    subgraph Input_0["<div class="ff-inputfile"><span class="index">0</span><span class="demuxer_name">matroska,webm</span><span class="file_extension">mkv</span><span class="url">U:\TestMedia\Test\Test.mkv</span></div>"]

      subgraph InputStreams_0["<div class="ff-inputstreams"></div>"]

        r_in_0_0("<div class="ff-inputstream video"><span class="name">H.264 / AVC / MPEG-4 AVC / MPEG-4 part 10</span><span class="index">0</span></div>"):::ff-inputstream

        r_in_0_1("<div class="ff-inputstream audio"><span class="name">DCA (DTS Coherent Acoustics)</span><span class="index">1</span></div>"):::ff-inputstream

        r_in_0_2("<div class="ff-inputstream audio"><span class="name">DCA (DTS Coherent Acoustics)</span><span class="index">2</span></div>"):::ff-inputstream

        r_in_0_3("<div class="ff-inputstream subtitle"><span class="name">HDMV Presentation Graphic Stream subtitles</span><span class="index">3</span></div>"):::ff-inputstream

        r_in_0_4("<div class="ff-inputstream subtitle"><span class="name">DVD subtitles</span><span class="index">4</span></div>"):::ff-inputstream

        r_in_0_5("<div class="ff-inputstream subtitle"><span class="name">HDMV Presentation Graphic Stream subtitles</span><span class="index">5</span></div>"):::ff-inputstream

        r_in_0_6("<div class="ff-inputstream subtitle"><span class="name">HDMV Presentation Graphic Stream subtitles</span><span class="index">6</span></div>"):::ff-inputstream

        r_in_0_7("<div class="ff-inputstream subtitle"><span class="name">DVD subtitles</span><span class="index">7</span></div>"):::ff-inputstream
      end
      class InputStreams_0 ff-inputstreams
    end
    class Input_0 ff-inputfile
  end
  class G2_Inputs ff-inputfiles


  subgraph G2_Decoders["<div class="ff-decoders"></div>"]

    in_0_0(["<div class="ff-decoder video"><span class="name">h264_qsv</span></div>"]):::ff-decoder

    in_0_1(["<div class="ff-decoder audio"><span class="name">dca</span></div>"]):::ff-decoder

    in_0_3(["<div class="ff-decoder subtitle"><span class="name">pgssub</span></div>"]):::ff-decoder
  end
  class G2_Decoders ff-decoders

  r_in_0_0 ==> in_0_0
  r_in_0_1 ==> in_0_1
  r_in_0_3 ==> in_0_3

  subgraph G2_Encoders["<div class="ff-encoders"></div>"]

    out__0_0(["<div class="ff-encoder video"><span class="name">hevc_qsv</span></div>"]):::ff-encoder

    out__0_1(["<div class="ff-encoder audio"><span class="name">libvorbis</span></div>"]):::ff-encoder

    out__0_2(["<div class="ff-encoder subtitle"><span class="name">dvbsub</span></div>"]):::ff-encoder
  end
  class G2_Encoders ff-encoders

  out__0_0 ==> r_out__0_0
  out__0_1 ==> r_out__0_1
  out__0_2 ==> r_out__0_2

  subgraph G2_Outputs["<div class="ff-outputfiles"></div>"]

    subgraph Output_0["<div class="ff-outputfile"><span class="index">0</span><span class="muxer_name">matroska</span><span class="file_extension">mkv</span><span class="url">out1.mkv</span></div>"]

      subgraph OutputStreams_0["<div class="ff-outputstreams"></div>"]

        r_out__0_0("<div class="ff-outputstream video"><span class="name">H.265 / HEVC (High Efficiency Video Coding)</span><span class="index">0</span></div>"):::ff-outputstream

        r_out__0_1("<div class="ff-outputstream audio"><span class="name">Vorbis</span><span class="index">1</span></div>"):::ff-outputstream

        r_out__0_2("<div class="ff-outputstream subtitle"><span class="name">DVB subtitles</span><span class="index">2</span></div>"):::ff-outputstream

        r_out__0_3("<div class="ff-outputstream subtitle"><span class="name">DVD subtitles</span><span class="index">3</span></div>"):::ff-outputstream
      end
      class OutputStreams_0 ff-outputstreams
    end
    class Output_0 ff-outputfile
  end
  class G2_Outputs ff-outputfiles


  in_0_3 == "<span>Transcode</span><br>&nbsp;" ==> out__0_2
  r_in_0_7 == "<span>Stream Copy</span><br>&nbsp;" ==> r_out__0_3
```

### Command Line

```
ffmpeg -v verbose -y -print_graphs_file mermaid.html -print_graphs_format mermaidhtml -init_hw_device d3d11va=d1:2 -init_hw_device qsv@d1 -hwaccel qsv -c:v h264_qsv -i source.mkv  -filter_complex "[0:0]scale_qsv=w=512:h=256[f1_out0]" -af "aecho,volume" -map [f1_out0] -map 0:1 -map s:0 -c:s:0 dvbsub -map s:4 -c:s:1 copy -c:v hevc_qsv  out1.mkv
a

```