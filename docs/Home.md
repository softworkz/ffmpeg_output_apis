

# FFmpeg Output APIs
## for Text and Diagramming

This is a collection of efforts in improving output and presentation of FFmpeg.

It covers the following areas:

### 1. AVTextFormat API

Reshaping the "writers api" (ffprobe output) into an independent and re-usable API within FFmpeg.

STATUS: Completed, pending merge


### 2. YAML Output Format

Implement a new TextFormatter for creating YAML output.

STATUS: Ready for submission once (1) is meged


### 3. Filtergraph Data Output

Feature for outputting filtergraph details in machine-readable formats (like those that FFprobe includes), using the new AVTextFormat API (1)

STATUS: Mostly done, some details need discussion


### 4. Self-Printing Data Schema

STATUS: Exploration. Working prototype can generate Entity Relationship diagrams, and output some kind of schema information in all available output formats, but it cannot create real JSON or XSD schemas yet.


## Questions

Feel free to open an issue or post on the FFmpeg Mailing list.


