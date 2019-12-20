require 'rspec'
require 'word'

describe '#Word' do

before(:each) do
    Word.clear()
    # Definition.clear()
  end

  describe('#==') do
  it("is the same word if it has the same attributes as another word") do
    word = Word.new("intense", nil)
    word2 = Word.new("intense", nil)
    expect(word).to(eq(word2))
  end
 end

 describe('#update') do
 it("updates a word by id") do
   word = Word.new("capricious", nil)
   word.save()
   word.update("inconstant")
   expect(word.name).to(eq("inconstant"))
 end
end

describe('#save') do
it("saves a word") do
  word = Word.new("euphemism", nil)
  word.save()
  word2 = Word.new("glib", nil)
  word2.save()
  expect(Word.all).to(eq([word, word2]))
 end
end

describe('#delete') do
it("deletes an word by id") do
  word = Word.new("lurid", nil)
  word.save()
  word2 = Word.new("tryst", nil)
  word2.save()
  word.delete()
  expect(Word.all).to(eq([word2]))
 end
end

describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("zealous", nil)
      word.save()
      word2 = Word.new("scintillating", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("elucidate", nil)
      word.save()
      word2 = Word.new("chuffed", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

end