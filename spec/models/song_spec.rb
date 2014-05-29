require "spec_helper"

describe Song do
  let(:song) { Song.new }
  let(:saved_playlist) { Playlist.create!(:name => "test_playlist") }
  subject { song }

  it { should respond_to :playlist }

  it "should allow new songs on a playlist" do
    song.attributes={:playlist_id => saved_playlist.id, :name => "Like a virgin",
        :artist => "Madonna", :album => "Greatest Hits", :href => "madonna123"}
    song.should be_valid
  end

  it "should not allow repeat songs on a same playlist" do
    used_song = Song.create(:playlist_id => saved_playlist.id, :name => "Like a virgin",
                            :artist => "Madonna", :album => "Greatest Hits", :href => "fake123")
    new_song = Song.new(used_song.attributes.except("id", "accepted"))
    new_song.should_not be_valid
  end

end