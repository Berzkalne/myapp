require 'spec_helper'

describe 'Home safe redirecting' do
  it 'should display informaton about this website' do |variable|
    visit root_path 
    expect(page).to have_link I18n.t('home.menu.log_in')  
    expect(page).to have_button I18n.t('home.index.color_change')
    expect(page).to have_selector('h1', I18n.t('home.index.description'))
    expect(page).to have_selector('h1', I18n.t('home.index.title'))
  end
end