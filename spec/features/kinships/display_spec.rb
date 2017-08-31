require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }
  let!(:kinship){ create :kinship }

  before do
    login_as user
  end

  it 'should display info about all kinships' do
    visit kinships_path
    expect(page).to have_content I18n.t('kinships.index.title')
    expect(page).to have_link I18n.t('kinships.index.new')
    expect(page).to have_link kinship.name
  end

  it 'should go to new kinship page' do
    visit kinships_path
    click_link I18n.t('kinships.index.new')
    expect(page).to have_content I18n.t('kinships.new.title')
  end
end