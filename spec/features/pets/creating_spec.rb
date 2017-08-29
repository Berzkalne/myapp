require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }
  let!(:pet){ create :pet }
  let!(:unicorn){ create :unicorn }

  before do
    login_as user
  end

  it 'should create a new pet' do
    visit new_pet_path
    expect(page).to have_content I18n.t('pets.new.title')

    fill_in 'pet_name', with: 'Bobby'
    fill_in 'pet_eye_color', with: 'Black'
    fill_in 'pet_favourite_food', with: 'marshmallow'
    select('Carl', :from => 'pet[unicorn_id]')
    click_button 'Create Pet'

    pet = Pet.last
    expect(page).to have_content I18n.t('pets.notifications.created')
    expect(page).to have_content I18n.t('pets.show.title', name: pet.name)
    expect(pet.name).to eq 'Bobby'
    expect(pet.eye_color).to eq 'Black'
    expect(pet.favourite_food).to eq 'marshmallow'
  end
end
