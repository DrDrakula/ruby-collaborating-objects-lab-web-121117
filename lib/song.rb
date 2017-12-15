require 'pry'
require_relative 'artist'

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name.name)
    self.artist.add_song(self)
  end

  def self.new_by_filename(file_name)
    data = file_name.split(" - ")
    artist = data[0]
    song_name = data[1]
    song = self.new(song_name)
    song.artist_name = Artist.new(artist)
    song
    # binding.pry
  end
end
