# 4 Link Coloring
## 4 Link Coloring


GitHub doesn't support this at the moment 

![Colored Linkse](../images/colored_linkse.png)

### Command Line

```
ffmpegd.exe -y -print_graphs_file mermaid.mmd -print_graphs_format mermaid -i file1.mkv  -filter_complex "[0:0]yadif@jf_x,split[split_1][split_2];[split_2]scale=size=512x256[scaled_1];[split_1][scaled_1]overlay[f1_out0]" -af:0 "aecho,volume" -map [f1_out0] -map 0:2 -map 0:1  -map s:0 -c:s:0 dvbsub   out1.mkv -filter_complex "[0:2]asplit[f3_out],a3dscope,[0:0]overlay[f2_out]"  -map [f2_out] -map [f3_out] -map s:3 -c:s dvbsub -c:v libx264 out2.ts
```