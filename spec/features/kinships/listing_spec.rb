require 'spec_helper'

describe 'Show safe redirecting' do
  let!(:user){ create :user }
  let!(:kinship){ create :kinship }

  before do
    login_as user
  end

  it 'should display info about kinships' do
    visit kinships_path
    click_link kinship.name
    expect(page).to have_content kinship.name
    expect(page).to have_content kinship.description
    expect(page).to have_link I18n.t('kinships.show.edit')
    expect(page).to have_content I18n.t('kinships.show.title', name: kinship.name)
    expect(page).to have_content I18n.t('kinships.show.destroy')
    click_link I18n.t('kinships.show.edit')
    expect(page).to have_content I18n.t('kinships.edit.title')
  end
end