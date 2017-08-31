require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }

  let(:attrs) do{
    name: 'Robis',
    email: 'hey@hey.com',
    password: 'Password',
    password_confirmation: 'Password',
    age: 20,
    description: 'i feel like trash'
  }
  end

  before do
    login_as user
  end

  it 'should create a new subject' do
    visit new_user_path
    expect(page).to have_content I18n.t('users.new.title')

    fill_in 'user_name', with: attrs[:name]
    fill_in 'user_email', with: attrs[:email]
    fill_in 'user_password', with: attrs[:password]
    fill_in 'user_password_confirmation', with: attrs[:password_confirmation]
    fill_in 'user_age', with: attrs[:age]
    fill_in 'user_description', with: attrs[:description]
    click_button I18n.t('helpers.submit.unicorn.create')

    user = User.last
    expect(page).to have_content I18n.t('users.notifications.created')
    expect(page).to have_content I18n.t('users.show.title', name: user.name)
    expect(user.name).to eq attrs[:name]
    expect(user.email).to eq attrs[:email]
    expect(user.age).to eq attrs[:age]
    expect(user.description).to eq attrs[:description]
  end

  it 'should display error message' do 
    visit new_user_path
    expect(page).to have_content I18n.t('users.new.title')

    fill_in 'user_name', with: attrs[:name]
    fill_in 'user_email', with: attrs[:email]
    click_button I18n.t('helpers.submit.create')

    expect(page).to have_content I18n.t('users.notifications.invalid')
  end
end
