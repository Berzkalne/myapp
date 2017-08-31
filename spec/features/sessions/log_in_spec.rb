require 'spec_helper'

describe 'User log in' do
  let!(:user){ create :user }

  it 'should create a new session' do
    visit log_in_path
    fill_in 'session_email', with: 'email@email.com'
    fill_in 'session_password', with: 'password'
    click_button I18n.t('sessions.new.submit')
    expect(page).to have_content I18n.t('sessions.notifications.created')
    expect(page).to have_content I18n.t('users.show.title', name: user.name)
    expect(page).not_to have_content I18n.t('home.index.title')
  end

  it 'should not create a new session' do
    visit log_in_path
    fill_in 'session_email', with: 'email@email.com'
    click_button I18n.t('sessions.new.submit')
    expect(page).to have_content I18n.t('sessions.notifications.invalid')
  end
end
