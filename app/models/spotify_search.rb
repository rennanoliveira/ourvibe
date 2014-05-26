class SpotifySearch
  include HTTParty
  base_uri 'https://ws.spotify.com'

  #TODO: paginate search?
  def search(type, query)
    response = self.class.get("/search/1/#{type}.json?q=#{query.gsub(" ", "%20")}")
    JSON.parse(response.body)
  end

  def albums(query)
    raw_albums = search("album", query)
    parse_albums(raw_albums)
  end

  def artists(query)
    raw_artists = search("artist", query)
    parse_artists(raw_artists)
  end

  def tracks(query)
    raw_tracks = search("track", query)
    @tracks = parse_tracks(raw_tracks)
  end

  def parse_albums(raw_tracks)

  end

  def parse_artists(raw_artists)

  end

  def parse_tracks(raw_tracks)
    tracks = []
    if raw_tracks["info"]["num_results"] > 0
      raw_tracks["tracks"].each do |raw_track|
        album_name = raw_track["album"]["name"]
        name = raw_track["name"]
        artist = raw_track["artists"].first["name"]
        href = raw_track["href"]
        tracks << {:name => name + " (#{artist})", :id => href}
      end
    end
    tracks
  end
end