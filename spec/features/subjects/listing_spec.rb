require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }
  let!(:subject){ create :subject }

  before do
    login_as user
  end

  it 'should display info about subject' do
    visit subjects_path
    click_link subject.name
    expect(page).to have_content subject.room
    expect(page).to have_content I18n.t('subjects.show.title', name: subject.name)
  end
end