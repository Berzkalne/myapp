require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }
  let!(:pet){ create :pet }

  before do
    login_as user
  end

  it 'should display info about pets' do
    visit pets_path
    click_link pet.name
    expect(page).to have_content I18n.t('pets.show.title', name: pet.name)
    expect(page).to have_content pet.favourite_food
    expect(page).to have_content pet.eye_color
  end
end
