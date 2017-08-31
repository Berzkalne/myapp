require 'spec_helper'

describe 'Edit safe redirecting' do
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

  it 'should alow to edit info' do
    visit edit_pet_path(pet)
    expect(page).to have_content I18n.t('pets.edit.title')

    fill_in 'pet_name', with: attrs[:name]
    select('Carl', :from => 'pet[unicorn_id]')
    click_button I18n.t('helpers.submit.update')

    pet.reload
    expect(pet.name).to eq attrs[:name]
  end
end