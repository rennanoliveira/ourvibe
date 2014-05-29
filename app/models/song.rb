class Song < ActiveRecord::Base
  attr_accessible :name, :artist, :album, :href, :playlist_id

  belongs_to :playlist

  validates_presence_of :name

  validates :name, :artist, :album, :href, :playlist_id, :presence => true
  validates_uniqueness_of :href, :scope => :playlist_id

end