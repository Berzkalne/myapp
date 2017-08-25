require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }

  before do
    login_as user
  end

  it 'should display info about unicorn' do
    visit unicorns_path
    expect(page).to have_content I18n.t('unicorns.index.title')
    expect(page).to have_link I18n.t('unicorns.index.new')
    click_link I18n.t('unicorns.index.new')
    expect(page).to have_content I18n.t('unicorns.new.title')
  end
end
