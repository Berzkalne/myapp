require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }

  before do
    login_as user
  end

  it 'should alow to edit info' do
    expect(page).to have_link I18n.t('users.show.edit')
    click_link I18n.t('users.show.edit')
    expect(page).to have_content I18n.t('users.edit.title')
    expect(page).to have_content "Username"
    expect(page).to have_content "E-mail"
    expect(page).to have_content "Password"
    expect(page).to have_content "Password confirmation"
    expect(page).to have_content "Age"
    expect(page).to have_content "Description"
  end
end
