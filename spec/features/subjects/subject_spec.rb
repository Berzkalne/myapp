require 'spec_helper'

describe 'Show safe redirecting' do
  let!(:user){ create :user }
  let!(:subject){ create :subject }

  before do
    login_as user
  end

  it 'should display new subject form' do
    visit subjects_path
    click_link I18n.t('subjects.index.new')
    expect(page).to have_content I18n.t('subjects.new.title')
  end

   it 'should display info about subject' do
    visit subjects_path
    click_link subject.name
    expect(page).to have_content I18n.t('subjects.show.title', name: subject.name)
  end

  it 'should display edit subject form' do
    visit subject_path(subject)
    click_link I18n.t('subjects.show.edit')
    expect(page).to have_content I18n.t('subjects.edit.title')
  end
end