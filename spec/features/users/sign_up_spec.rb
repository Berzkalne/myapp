require 'spec_helper'

describe 'Sign up safe redirecting' do 
  it 'should display sign up form' do 
    visit new_user_path
    expect(page).to have_content I18n.t('users.new.title')
    expect(page).to have_content "Username"
    expect(page).to have_content "E-mail"
    expect(page).to have_content "Password"
    expect(page).to have_content "Password confirmation"
    expect(page).to have_content "Age"
    expect(page).to have_content "Description"
  end
end
