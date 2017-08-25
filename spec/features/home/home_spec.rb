require 'spec_helper'

describe 'Home safe redirecting' do
  it 'should display informaton about this website' do |variable|
    visit root_path 
    expect(page).to have_link I18n.t('home.menu.log_in')  
    expect(page).to have_content I18n.t('home.index.color_change')
    expect(page).to have_content I18n.t('home.index.title')
    expect(page).to have_content I18n.t('home.index.description')
  end
  it 'should display log in page' do
    visit root_path
    click_link "Log in"
    expect(page).to have_content I18n.t('sessions.new.title')
  end
end