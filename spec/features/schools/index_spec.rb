require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }

  before do
    login_as user
  end

  it 'should display info about schools' do
    visit schools_path
    expect(page).to have_content I18n.t('schools.index.title')
    expect(page).to have_link I18n.t('schools.index.new')
    click_link I18n.t('schools.index.new')
    expect(page).to have_content I18n.t('schools.new.title')
  end
end
