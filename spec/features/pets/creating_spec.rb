require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }
  let!(:pet){ create :pet }
  let!(:unicorn){ create :unicorn }

  let(:attrs) do {
    name: 'Bobby',
    eye_color: 'Black',
    favourite_food: 'Marshmallow'
  }
  end

  before do
    login_as user
  end

  it 'should create a new pet' do
    visit new_pet_path
    expect(page).to have_content I18n.t('pets.new.title')

    fill_in 'pet_name', with: attrs[:name]
    fill_in 'pet_eye_color', with: attrs[:eye_color]
    fill_in 'pet_favourite_food', with: attrs[:favourite_food]
    select('Carl', :from => 'pet[unicorn_id]')
    click_button I18n.t('helpers.submit.create')

    pet = Pet.last
    expect(page).to have_content I18n.t('pets.notifications.created')
    expect(page).to have_content I18n.t('pets.show.title', name: pet.name)
    expect(pet.name).to eq attrs[:name]
    expect(pet.eye_color).to eq attrs[:eye_color]
    expect(pet.favourite_food).to eq attrs[:favourite_food]
  end
end
