class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    !!self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.new_from_filename(file)
    splitted = file.split(/[-\.]/)
    song = self.new_by_name(splitted[1].strip)
    song.artist_name = splitted[0].strip
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end
end
