require 'spec_helper'

describe 'Edit safe redirecting' do
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

  it 'should alow to edit info' do
    visit edit_school_path(school)
    expect(page).to have_content I18n.t('schools.edit.title')

    fill_in 'school_name', with: attrs[:name]
    fill_in 'school_location', with: attrs[:location]
    click_button I18n.t('helpers.submit.update')

    school.reload
    expect(school.name).to eq attrs[:name]
    expect(school.location).to eq attrs[:location]
  end
end