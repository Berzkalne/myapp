require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }
  let!(:school){ create :school}

  before do
    login_as user
  end

  it 'should display info about school' do
    visit schools_path
    click_link school.name
    expect(page).to have_content school.location
    expect(page).to have_content I18n.t('schools.show.title', name: school.name)
  end
end