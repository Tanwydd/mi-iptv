#!/usr/bin/env bash
set -euo pipefail
curl -sL "https://www.tdtchannels.com/lists/tv.m3u8" -o /tmp/tdt.m3u8

{
  echo "#EXTM3U"
  awk '/#EXTINF/{inf=$0; getline url;
    if (inf ~ /group-title="(Nacionales|Andalucía)"/ ||
        inf ~ /Condavisión|Doñana|Teleonuba|CanalCosta|Huelva/)
      print inf "\n" url }' /tmp/tdt.m3u8
} > mi_lista.m3u8

echo "Canales: $(grep -c '#EXTINF' mi_lista.m3u8)"
