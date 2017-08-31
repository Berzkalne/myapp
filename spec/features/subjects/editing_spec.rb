require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }
  let!(:school){ create :school }
  let!(:subject){ create :subject }

  let(:attrs) do
    {
      name: 'Latvian',
      room: 222
    }
  end

  before do
    login_as user
  end

  it 'should alow to edit info' do
    visit edit_subject_path(subject)
    expect(page).to have_content I18n.t('subjects.edit.title')

    fill_in 'subject_name', with: attrs[:name]
    fill_in 'subject_room', with: attrs[:room]
    select('Hill high school', :from => 'subject[school_id]')
    click_button I18n.t('helpers.submit.update')

    subject.reload
    expect(subject.name).to eq attrs[:name]
    expect(subject.room).to eq attrs[:room]
  end
end