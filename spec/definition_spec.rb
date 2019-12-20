require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do 

before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("narky", nil)
    @word.save()
  end

 describe('#==') do
   it("is the same definition if it has the same attributes as another definition") do
    definition = Definition.new("barmy - containing or resembling barm; frothy", @word.id, nil)
    definition2 = Definition.new("barmy - containing or resembling barm; frothy", @word.id, nil)
    expect(definition).to(eq(definition2))
  end
 end

 describe('.all') do
   it("returns a list of all definitions") do
      definition = Definition.new("dexterous - showing or having skill, especially with the hands", @word.id, nil)
      definition.save()
      definition2 = Definition.new("disarming - (of manner or behavior) having the effect of allaying suspicion or hostility, especially through charm", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("caper - skip or dance about in a lively or playful way", @word.id, nil)
      definition.save()
      definition2 = Definition.new("apathetic - showing or feeling no interest, enthusiasm, or concern", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
    definition = Definition.new("solicitude - care or concern for someone or something", @word.id, nil)
    definition.save()
    expect(Definition.all).to(eq([definition]))
  end
 end

 describe('.find') do
   it("finds a definition by id") do
      definition = Definition.new("agelastic - a person who never laughs", @word.id, nil)
      definition.save()
      definition2 = Definition.new("infucation - the act of painting or staining, especially of painting the face", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
    definition = Definition.new("nimbose - cloudy; stormy; tempestuous", @word.id, nil)
    definition.save()
    definition.update("cloudy - covered with or characterized by clouds; overcast", @word.id)
    expect(definition.name).to(eq("cloudy - covered with or characterized by clouds; overcast"))
  end
end

  describe('#delete') do
    it("deletes a definition by id") do
    definition = Definition.new("precocious - having developed certain abilities or proclivities at an earlier age than usual", @word.id, nil)
    definition.save()
    definition2 = Definition.new("chaos - complete disorder and confusion", @word.id, nil)
    definition2.save()
    definition.delete()
    expect(Definition.all).to(eq([definition2]))
  end
end

  describe('.find_by_word') do
    it("finds definitions for a word") do
      word2 = Word.new("entropy", nil)
      word2.save
      definition = Definition.new("an extensive property of a thermodynamic system", @word.id, nil)
      definition.save()
      definition2 = Definition.new("lack of order or predictability; gradual decline into disorder", word2.id, nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
    definition = Definition.new("insoluble - impossible to solve", @word.id, nil)
    definition.save()
    expect(definition.word()).to(eq(@word))
  end
end

end