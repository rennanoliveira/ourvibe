require "spec_helper"

describe Playlist do
  let(:playlist) { Playlist.new }
  subject { playlist }

  it { should respond_to :songs }


  describe "creating new playlist" do
    it "should upcase the name" do
      playlist.name = "upcase"
      playlist.save
      playlist.name.should eql "UPCASE"
    end


    it "should set a default code" do
      playlist.code = nil
      playlist.save
      playlist.code.should_not be_blank
    end

    it "should encrypt the password if any" do
      playlist.password = "testpassword"
      playlist.save
      playlist.password_sha1.should_not be_blank
    end

    it "should not encrypt the password if none given" do
      playlist.password = ""
      playlist.save
      playlist.password_sha1.should be_blank
    end

  end

  describe "getting spotify link" do
    it "should return a formatted uri for the widget" do
      playlist.name = "SAMPLE"
      playlist.should_receive(:hrefs_from_songs).once.and_return("123,456,789")
      playlist.spotify_uri.should eql "spotify:trackset:SAMPLE:123,456,789"
    end
  end

end