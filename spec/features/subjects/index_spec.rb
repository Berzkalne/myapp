require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }

  before do
    login_as user
  end

  it 'should display info about subjects' do
    visit subjects_path
    expect(page).to have_content I18n.t('subjects.index.title')
    expect(page).to have_link I18n.t('subjects.index.new')
    click_link I18n.t('subjects.index.new')
    expect(page).to have_content I18n.t('subjects.new.title')
  end
end
