class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def note_contents
    self.notes.map {|note| note.content}
  end 

  def note_contents=(contents)
    contents.each do |content|
      if content != ""
        self.notes << Note.create(content: content)
      end
    end 
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def genre_name
    self.genre ? self.genre.name : nil
  end 

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 

  def note_ids=(ids)
    ids.each do |id|
      if id != ""
        self.note_contents = id
      end 
    end
  end 
end
