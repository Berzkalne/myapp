require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }
  let!(:kinship){ create :kinship }

  before do
    login_as user
  end

  it 'should alow to edit info' do
    visit edit_kinship_path(kinship)
    expect(page).to have_content I18n.t('kinships.edit.title')

    fill_in 'kinship_name', with: 'Marlie'
    click_button 'Update Kinship'

    kinship.reload
    expect(kinship.name).to eq 'Marlie'
  end
end