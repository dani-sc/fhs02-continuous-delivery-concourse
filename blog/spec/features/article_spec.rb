require 'rails_helper'

describe "the article creation process", :type => :feature do
  it 'will create a new article' do
    visit '/articles/new'
    article_name = 'Concourse - Is it really that great?'
    fill_in('Name', with: article_name)
    click_button 'Create Article'
    expect(page).to have_content 'success'
    expect(page).to have_content article_name
  end

  it 'will fail to create a new article' do
    visit '/articles/new'
    # Do not fill in the mandatory name
    click_button 'Create Article'
    expect(page).to have_content 'error'
  end
end