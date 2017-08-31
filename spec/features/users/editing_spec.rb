require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }

  before do
    login_as user
  end

  it 'should alow to edit info' do
    visit edit_user_path(user)
    expect(page).to have_content I18n.t('users.edit.title')

    fill_in 'user_age', with: '19'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button I18n.t('helpers.submit.update')

    user.reload
    expect(user.age).to eq 19
    expect(page).to have_content user.age
  end
end
