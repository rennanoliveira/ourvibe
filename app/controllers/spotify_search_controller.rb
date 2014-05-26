class SpotifySearchController < ApplicationController

  respond_to :json

  def index
    search = SpotifySearch.new
    tracks = search.tracks(params[:q])
    respond_with(tracks)
  end


end
