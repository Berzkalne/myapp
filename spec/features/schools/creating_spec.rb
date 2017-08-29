require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }
  let!(:school){ create :school }

  before do
    login_as user
  end

  it 'should create a new subject' do
    visit new_school_path
    expect(page).to have_content I18n.t('schools.new.title')

    fill_in 'school_name', with: 'Melisa'
    fill_in 'school_location', with: 'the hill'
    click_button 'Create School'

    school = School.last
    expect(school.name).to eq 'Melisa'
    expect(school.location).to eq 'the hill'
  end
end