require 'pry'
require_relative 'song'
require_relative 'artist'
class MP3Importer
  attr_reader :path
  attr_accessor :files

  def initialize(music_path)
    @path = music_path
  end

  def files
    music = Dir.entries(@path).select {|f| !File.directory? f}
  end

  def import
    songs = self.files.each do |file_name|
      song = Song.new_by_filename(file_name)
    end

    # binding.pry
  end

end
