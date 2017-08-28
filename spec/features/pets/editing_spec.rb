require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }
  let!(:pet){ create :pet }
  let!(:unicorn){ create :unicorn }

  before do
    login_as user
  end

  it 'should alow to edit info' do
    visit edit_pet_path(pet)
    expect(page).to have_content I18n.t('pets.edit.title')

    fill_in 'pet_name', with: 'Maggie'
    select('Carl', :from => 'pet[unicorn_id]')
    click_button 'Update Pet'

    pet.reload
    expect(pet.name).to eq 'Maggie'
  end
end