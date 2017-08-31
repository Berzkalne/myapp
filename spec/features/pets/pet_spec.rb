require 'spec_helper'

describe 'Show safe redirecting' do
  let!(:user){ create :user }
  let!(:pet){ create :pet }

  before do
    login_as user
  end

  it 'should display new pet form' do
    visit pets_path
    click_link I18n.t('pets.index.new')
    expect(page).to have_content I18n.t('pets.new.title')
  end

   it 'should display info about pet' do
    visit pets_path
    click_link pet.name
    expect(page).to have_content I18n.t('pets.show.title', name: pet.name)
  end

  it 'should display edit pet form' do
    visit pet_path(pet)
    click_link I18n.t('pets.show.edit')
    expect(page).to have_content I18n.t('pets.edit.title')
  end
end