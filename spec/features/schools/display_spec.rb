require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }
  let!(:school){ create :school}

  before do
    login_as user
  end

  it 'should display info about schools' do
    visit schools_path
    expect(page).to have_link school.name
    expect(page).to have_content I18n.t('schools.index.title')
  end
end
