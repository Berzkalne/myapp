require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }

  before do
    login_as user
  end

  it 'should create a new user' do
    visit new_user_path
    expect(page).to have_content I18n.t('users.new.title')

    fill_in 'user_name', with: 'robis'
    fill_in 'user_email', with: 'hey@hey.com'
    fill_in 'user_password', with: 'Password'
    fill_in 'user_password_confirmation', with: 'Password'
    fill_in 'user_age', with: '20'
    fill_in 'user_description', with: 'i feel like trash'
    click_button 'Create User'

    user = User.last
    expect(page).to have_content I18n.t('users.notifications.created')
    expect(page).to have_content I18n.t('users.show.title', name: user.name)
    expect(user.name).to eq 'robis'
    expect(user.email).to eq 'hey@hey.com'
    expect(user.age).to eq 20
    expect(user.description).to eq 'i feel like trash'
  end

  it 'should display error message' do 
    visit new_user_path
    expect(page).to have_content I18n.t('users.new.title')

    fill_in 'user_name', with: 'robis'
    fill_in 'user_email', with: 'hey@hey.com'
    click_button 'Create User'

    expect(page).to have_content I18n.t('users.notifications.invalid')
  end
end
