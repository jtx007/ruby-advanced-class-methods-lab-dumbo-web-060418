require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.name(name)
    self.name = name
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
    # binding.pry
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
    new_song = self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}

  end

  def self.new_from_filename(filename)
    split_filename = filename.split(" - ")
    artist = split_filename[0]
    song_name = split_filename[1].split(".")[0]
    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    split_filename = filename.split(" - ")
    artist = split_filename[0]
    song_name = split_filename[1].split(".")[0]
    new_song = self.create
    new_song.name = song_name
    new_song.artist_name = artist
    new_song
  end

  def self.destroy_all
    self.all.clear
  end




end
