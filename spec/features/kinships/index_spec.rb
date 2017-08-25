require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }

  before do
    login_as user
  end

  it 'should display info about kinships' do
    visit kinships_path
    expect(page).to have_content I18n.t('kinships.index.title')
    expect(page).to have_link I18n.t('kinships.index.new')
    click_link I18n.t('kinships.index.new')
    expect(page).to have_content I18n.t('kinships.new.title')
  end
end
