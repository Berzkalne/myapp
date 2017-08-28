require 'spec_helper'

describe 'Show safe redirecting' do
  let!(:user){ create :user }
  let!(:unicorn){ create :unicorn }

  before do
    login_as user
  end

  it 'should display info about user' do
    expect(page).to have_link I18n.t('users.show.edit')
    expect(page).to have_content I18n.t('users.show.title', name: user.name)
    expect(page).to have_content user.age
    expect(page).to have_content user.description
    expect(page).to have_content I18n.t('users.show.destroy')
  end

  it 'should display user edit form' do
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
