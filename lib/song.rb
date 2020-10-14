require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

def initialize
  @name = name
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
  song = self.new
  song.name=(name)
  song
  
end

def self.create_by_name(name)
  song = self.new
  song.name=(name)
  # binding.pry
  @@all << song
  song
end

def self.find_by_name(name)
  all.find{|song| song.name == name}  

end

def self.find_or_create_by_name(name)
    
    # song.name=(name)
    # if @@all.include?(song)
    #   song
    # else
    #   song = self.new
    # # song.name=(name)
    # # binding.pry
    # @@all << song
    # song
    
   if self.find_by_name(name) == nil
  self.create_by_name(name)
  else  
     self.find_by_name(name)
  end

    
  


end


def self.alphabetical
  @@all.sort_by{|song|song.name}
end

def self.new_from_filename(mp3)
  song = mp3
  # binding.pry
  array = song.split(/[.-]/)
  array.pop
  array[1]=array[1].strip
  array[0]=array[0].strip
  instance = self.new
  instance.name=(array[1])
  instance.artist_name=(array[0])
  instance
end

def self.create_from_filename(mp3)
  instance = self.new_from_filename(mp3)
  # binding.pry
  @@all << instance
  
end

def self.destroy_all
  @@all.clear
end
  


end




