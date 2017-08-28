require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }
  let!(:pet){ create :pet }

  before do
    login_as user
  end

  it 'should display info about pets' do
    visit pets_path
    expect(page).to have_content pet.name
    expect(page).to have_content pet.eye_color
    expect(page).to have_content I18n.t('pets.index.title')
    expect(page).to have_link I18n.t('pets.index.new')
  end

  it 'should display new pet form' do
    visit pets_path
    click_link I18n.t('pets.index.new')
    expect(page).to have_content I18n.t('pets.new.title')
  end
end
