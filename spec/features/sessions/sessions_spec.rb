require 'spec_helper'

describe 'Log in safe redirecting' do 
  it 'should display log in form' do
    visit log_in_path
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end
  it 'should display information about sign up page' do 
    visit log_in_path
    click_link I18n.t('sessions.new.signup')
    expect(page).to have_content I18n.t('users.new.title')
  end
end
