require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }

  before do
    login_as user
  end

  it 'should display info about pets' do
    visit pets_path
    expect(page).to have_content I18n.t('pets.index.title')
    expect(page).to have_link I18n.t('pets.index.new')
    click_link I18n.t('pets.index.new')
    expect(page).to have_content I18n.t('pets.new.title')
  end
end
