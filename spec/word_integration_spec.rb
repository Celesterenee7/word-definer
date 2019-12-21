require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

before(:each) do
    Word.clear()
    Definition.clear()
  end

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add Word')
    fill_in('word_name', :with => 'Chaos')
    click_on('Add Word!')
    expect(page).to have_content('Chaos')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
     word = Word.new("Enlightened", nil)
     word.save
     visit("/words/#{word.id}")
     fill_in('definition_name', :with => 'having or showing a rational, modern, and well-informed outlook.')
     click_on('Save')
     expect(page).to have_content('having or showing a rational, modern, and well-informed outlook.')
   end
end