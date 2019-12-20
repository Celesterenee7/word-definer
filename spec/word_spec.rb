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

end