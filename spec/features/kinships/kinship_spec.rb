require 'spec_helper'

describe 'Show safe redirecting' do
  let!(:user){ create :user }
  let!(:kinship){ create :kinship }

  before do
    login_as user
  end

  it 'should display new kinship form' do
    visit kinships_path
    click_link I18n.t('kinships.index.new')
    expect(page).to have_content I18n.t('kinships.new.title')
  end

   it 'should display info about kinship' do
    visit kinships_path
    click_link kinship.name
    expect(page).to have_content I18n.t('kinships.show.title', name: kinship.name)
  end

  it 'should display edit kinship form' do
    visit kinship_path(kinship)
    click_link I18n.t('kinships.show.edit')
    expect(page).to have_content I18n.t('kinships.edit.title')
  end
end