#!/bin/bash

jq -c 'map(select(any(.track.album.artists[]; .name == "Aleman" or .name == "La Banda Baston" or .name == "Fntxy" or .name == "La Plebada" or .name == "Yoga Fire"))) | del(.[].track.available_markets) | del(.[].track.album.available_markets) | length' tracks.json > top5Artists.json


jq -c 'map(select(any(.track.album.artists[]; .name == "Aleman" or .name == "La Banda Baston" or .name == "Fntxy" or .name == "La Plebada" or .name == "Yoga Fire")))' processed/streaming_history_2022.json > top5Artists2022.json