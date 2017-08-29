require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }
  let!(:school){ create :school }

  before do
    login_as user
  end

  it 'should alow to edit info' do
    visit edit_school_path(school)
    expect(page).to have_content I18n.t('schools.edit.title')

    fill_in 'school_name', with: 'Unicorn school'
    fill_in 'school_location', with: 'New York'
    click_button 'Update School'

    school.reload
    expect(school.name).to eq 'Unicorn school'
    expect(school.location).to eq 'New York'
  end
end