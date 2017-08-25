require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }

  before do
    login_as user
  end

  it 'should alow to edit info about unicorn' do
    visit edit_unicorn_path
    expect(page).to have_content I18n.t('unicorns.edit.title')
    expect(page).to have_content "Name"
    expect(page).to have_content "Age"
    expect(page).to have_content "Horn lenght"
    expect(page).to have_content "Height"
    expect(page).to have_content "Kinship"
  end
end
