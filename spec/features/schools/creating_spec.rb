require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }
  let!(:school){ create :school }

  let(:attrs) do {
    name: 'Melisa',
    location: 'The Hill'
  }
  end

  before do
    login_as user
  end

  it 'should create a new subject' do
    visit new_school_path
    expect(page).to have_content I18n.t('schools.new.title')

    fill_in 'school_name', with: attrs[:name]
    fill_in 'school_location', with: attrs[:location]
    click_button I18n.t('helpers.submit.create')

    school = School.last
    expect(school.name).to eq attrs[:name]
    expect(school.location).to eq attrs[:location]
  end
end