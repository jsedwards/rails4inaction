require 'spec_helper'

feature 'Deleting projects' do 
  scenario 'delete a project' do 
    project = Project.create(name: 'Bad Idea')
    visit '/'
    click_link 'Bad Idea'
    click_link 'Delete Project'

    expect(page).to have_content('Project has been destroyed.')

    visit '/'
    expect(page).to_not have_content('Bad Idea')
  end
end