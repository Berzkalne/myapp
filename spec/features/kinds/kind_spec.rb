require 'spec_helper'

describe 'Show safe redirecting' do
  let!(:user){ create :user }
  let!(:kind){ create :kind }

  before do
    login_as user
  end

  it 'should display new kind form' do
    visit kinds_path
    click_link I18n.t('kinds.index.new')
    expect(page).to have_content I18n.t('kinds.new.title')
  end

   it 'should display info about kind' do
    visit kinds_path
    click_link kind.name
    expect(page).to have_content I18n.t('kinds.show.title', name: kind.name)
  end

  it 'should display edit kind form' do
    visit kind_path(kind)
    click_link I18n.t('kinds.show.edit')
    expect(page).to have_content I18n.t('kinds.edit.title')
  end
end