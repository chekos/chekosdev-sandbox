#!/bin/bash

jq -c '[ 
    .[] | 
    {track: .track.track_info, played_at: .played_at} | 
    .track.album.imageUrl = .track.album.images[1].url | 
    del(.track.album.images, (.. | .href?, .external_urls?, .external_ids?, .type?)) 
] | sort_by(.played_at)' interim/streaming_history.json \
> processed/streaming_history_2022.json