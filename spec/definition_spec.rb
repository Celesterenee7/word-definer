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

end