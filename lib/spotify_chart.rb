require 'json'
require 'open-uri'
require 'pry'

class SpotifyChart

  BASE_URL = "http://charts.spotify.com/api/tracks/most_streamed"

  def get_url(region)
    BASE_URL + "/#{region}/weekly/latest"
  end

  def get_json(url)
    JSON.load(open "#{url}")
  end

  def get_first_track_info(music_hash)
    artist_name = music_hash["tracks"].first["artist_name"]
    track_name = music_hash["tracks"].first["track_name"]
    album_name = music_hash["tracks"].first["album_name"]
      "#{track_name} by #{artist_name} from the album #{album_name}"
  end


  def most_streamed(region)
    region_url = get_url(region)
    json_hash = get_json(region_url)
    get_first_track_info(json_hash)
  end

end
