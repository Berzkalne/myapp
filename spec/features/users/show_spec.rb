require 'spec_helper'

describe 'Show safe redirecting' do
  let!(:user){ create :user }

  before do
    login_as user
  end

  it 'should display info about user' do
    expect(page).to have_link I18n.t('users.show.edit')
    expect(page).to have_content I18n.t('users.show.title', name: user.name)
    expect(page).to have_content I18n.t('users.show.destroy')
    click_link I18n.t('users.show.edit')
    expect(page).to have_content I18n.t('users.edit.title')
  end
end
