class Word
  attr_reader :id, :name

  @@words = {}
  @@total_rows = 0 

  def initialize(name, id) 
    @name = name
    @id = id || @@total_rows += 1 
  end

  def update(name)
    @name = name
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.all
    @@words.values()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def self.search(string)
    @@words.values().select {|e| /#{string}/i.match(e.name) }
  end

  def delete
    @@words.delete(self.id)
  end

  def definitions
    # binding.pry
    Definition.find_by_word(self.id)
  end
end