require 'spec_helper'

describe 'Show safe redirecting' do
  let!(:user){ create :user }
  let!(:school){ create :school }

  before do
    login_as user
  end

  it 'should display new school form' do
    visit schools_path
    click_link I18n.t('schools.index.new')
    expect(page).to have_content I18n.t('schools.new.title')
  end

   it 'should display info about school' do
    visit schools_path
    click_link school.name
    expect(page).to have_content I18n.t('schools.show.title', name: school.name)
  end

  it 'should display edit school form' do
    visit school_path(school)
    click_link I18n.t('schools.show.edit')
    expect(page).to have_content I18n.t('schools.edit.title')
  end
end