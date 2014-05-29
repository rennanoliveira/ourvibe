class PlaylistsController < ApplicationController

  def index
    respond_to do |format|
      format.html{}
      format.json{
        query = params[:q]
      }
    end

  end

end
