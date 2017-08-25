require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }

  before do
    login_as user
  end

  it 'should display info about cash turnovers' do
    visit cash_turnovers_path
    expect(page).to have_content I18n.t('cash_turnovers.index.title')
    expect(page).to have_link I18n.t('cash_turnovers.index.new')
    click_link I18n.t('cash_turnovers.index.new')
    expect(page).to have_content I18n.t('cash_turnovers.new.title')
  end
end
