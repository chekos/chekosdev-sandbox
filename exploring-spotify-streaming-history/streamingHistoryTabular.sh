jq -c '[
    .[] | { 
        playedAt: .played_at, 
        track: .track.name, 
        trackNumber: .track.track_number, 
        artist: .track.album.artists[0].name, 
        albumTotalTracks: .track.album.total_tracks, 
        albumName: .track.album.name, 
        albumType: .track.album.album_type, 
        albumReleaseDate: .track.album.release_date, 
        albumImageUrl: .track.album.imageUrl, 
        isExplicit: .track.explicit, 
        trackArtists: [.track.album.artists[].name], 
        previewUrl: .track.preview_url,
        uri: .track.uri
    }
] | sort_by(.playedAt)' processed/streaming_history_2022.json > processed/streamingHistory2022Tabular.json