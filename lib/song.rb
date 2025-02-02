  require 'pry'

  class Song
    attr_accessor :name, :artist_name, :song_name
    @@all = []


    def self.all
      @@all
    end


    def save
      self.class.all << self
    end


    def self.create
      new_song = self.new
      new_song.save
      return new_song
    end


    def self.new_by_name(name)
      new_song = self.new
      new_song.name = name
      return new_song
    end


    def self.create_by_name(name)
       new_song = self.create
       new_song.name = name
       return new_song
    end


    def self.find_by_name(name)
      @@all.detect {|song| song.name == name}
    end


    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create_by_name(name)
    end


    def self.alphabetical
       @@all.sort {|x, y| x.name  <=> y.name}
    end


    def self.new_from_filename(file_name)
      split_info = file_name.gsub(".", "-").split("-")
      artist_name = split_info[0]
      song_name = split_info[1]

      new_song = self.new_by_name(song_name.strip)
      new_song.artist_name = artist_name.strip
      return new_song
    end


    def self.create_from_filename(file_name)
      new_song = self.new_from_filename(file_name)
      new_song.save
    end


    def self.destroy_all
       @@all.clear
    end

end
