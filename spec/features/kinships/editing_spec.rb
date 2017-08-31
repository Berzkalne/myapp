require 'spec_helper'

describe 'Edit safe redirecting' do
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

  it 'should alow to edit info' do
    visit edit_kinship_path(kinship)
    expect(page).to have_content I18n.t('kinships.edit.title')

    fill_in 'kinship_name', with: attrs[:name]
    fill_in 'kinship_description', with: attrs[:description]
    click_button I18n.t('helpers.submit.update')

    kinship.reload
    expect(kinship.name).to eq attrs[:name]
    expect(kinship.description).to eq attrs[:description]
  end
end