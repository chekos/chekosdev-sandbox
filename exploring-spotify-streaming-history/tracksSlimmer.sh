#!/bin/bash

jq -c 'del(.[].track.available_markets, .[].track.album.available_markets, .[].played_at) | unique_by(.track.uri)' tracks.json > uniqueTracks.json

# only artist, album, track
jq -c '[.[] | {artist: .track.artists[0].name, album: .track.album.name, track: .track.name, uri: .track.uri}]' uniqueTracks.json > minMetadataTracks.json
