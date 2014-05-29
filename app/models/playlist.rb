class Playlist < ActiveRecord::Base

  attr_accessible :name

  has_many :songs

  attr_accessor :password

  validates :name, :code, :presence => true
  validates_uniqueness_of :code
  validates :password_sha1, :presence => true, :on => :create, :if => :password

  before_validation :set_code, :set_password_sha1, :on => :create
  before_validation :upcase_name, :on => :create

  def upcase_name
    self.name = self.name.mb_chars.upcase.to_s if self.name
  end

  def set_code
    self.code = SecureRandom.hex(5)
    self.code = SecureRandom.hex(5) while Playlist.where(:code => code).any?
  end

  def set_password_sha1
    self.password_sha1 = Digest::SHA1.hexdigest(password) if password.present?
  end

  def hrefs_from_songs
    self.songs.map{|song| song.href}.join(",")
  end

  def spotify_uri
    "spotify:trackset:#{self.name}:#{self.hrefs_from_songs}"
  end

end