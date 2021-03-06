require 'spec_helper'

feature 'Creating tickets' do 
  before do 
    project = Project.create(name: 'Internet Explorer')
    visit '/'
    click_link 'Internet Explorer'
    click_link 'New Ticket'
  end

  scenario 'Creating a ticket' do 
    fill_in 'Title', with: 'Non-standards compliance'
    fill_in 'Description', with: 'My pages are ugly!'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has been created.')
  end
  scenario 'Creating a ticket without valid attributes fails' do 
    click_button 'Create Ticket'
    expect(page).to have_content('Ticket has not been created.')
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end

