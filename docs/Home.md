

####  FFmpeg Output APIs for Text and Diagramming

This is a collection of efforts in improving output and presentation of FFmpeg. It covers the following areas:

## 1 AVTextFormat API

Reshaping the "writers api" (ffprobe output) into an independent and re-usable API within FFmpeg.

**STATUS:** Completed, pending merge; available here: https://github.com/ffstaging/FFmpeg/pull/52


## 2 YAML Output Format

Implement a new TextFormatter for creating YAML output.

**STATUS:** Ready for submission once (1) is meged


## 3 Execution Graph Output

It started with the idea of writing information about filtergraphs in ffmpeg and was extended to include data which provides a complete picture of ffmpeg execution runs.

### 3.1 As Formatted Data

Feature for outputting filtergraph and other details in machine-readable formats (like those supported by FFprobe), using the new AVTextFormat API (see 1).

- [Execution Graph Entities](execution_graph/Execution-Graph-Entities.md)
- Example Outputs
  - ...json

### 3.2 As Diagram

Feature for outputting filtergraph and other details in machine-readable formats (like those that FFprobe includes), using the new AVTextFormat API (1)

- [Translating To Diagram](execution_graph/Translating-to-Diagram.md)
- Examples
  - [Graphs Example1](visualization/Graphs-Example1.md)
  - [Graphs Example2](visualization/Graphs-Example2.md)
  - [Graphs Example3](visualization/Graphs-Example3.md)
  - [Graphs Example3 with Link Coloring](visualization/Graphs-Example3%20-Link-Coloring.md)

**STATUS:** Mostly done, some details need discussion


## 4 Self-Printing Data Schema

**STATUS:** Exploration. Working prototype can generate Entity Relationship diagrams, and output some kind of schema information in all available output formats, but it cannot create real JSON or XSD schemas yet.


## Questions?

Feel free to open an issue or post on the FFmpeg Mailing list.


