require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }
  let!(:school){ create :school }
  let!(:subject){ create :subject }

  before do
    login_as user
  end

  it 'should alow to edit info' do
    visit edit_subject_path(subject)
    expect(page).to have_content I18n.t('subjects.edit.title')

    fill_in 'subject_name', with: 'latvian'
    fill_in 'subject_room', with: '222'
    select('Hill high school', :from => 'subject[school_id]')
    click_button 'Update Subject'

    subject.reload
    expect(subject.name).to eq 'latvian'
    expect(subject.room).to eq 222
  end
end