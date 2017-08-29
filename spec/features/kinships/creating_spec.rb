require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }
  let!(:kinship){ create :kinship }

  before do
    login_as user
  end

  it 'should create a new subject' do
    visit new_kinship_path
    expect(page).to have_content I18n.t('kinships.new.title')

    fill_in 'kinship_name', with: 'Melisa'
    fill_in 'kinship_description', with: 'we are amazing'
    click_button 'Create Kinship'

    kinship = Kinship.last
    expect(kinship.name).to eq 'Melisa'
    expect(kinship.description).to eq 'we are amazing'
  end
end
