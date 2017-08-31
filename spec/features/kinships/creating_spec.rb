require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }
  let!(:kinship){ create :kinship }

  let(:attrs) do {
    name: 'Melisa',
    description: 'we are amazing'
  }
  end

  before do
    login_as user
  end

  it 'should create a new subject' do
    visit new_kinship_path
    expect(page).to have_content I18n.t('kinships.new.title')

    fill_in 'kinship_name', with: attrs[:name]
    fill_in 'kinship_description', with: attrs[:description]
    click_button I18n.t('helpers.submit.create')

    kinship = Kinship.last
    expect(page).to have_content I18n.t('.notifications.created')
    expect(kinship.name).to eq attrs[:name]
    expect(kinship.description).to eq attrs[:description]
  end
end
