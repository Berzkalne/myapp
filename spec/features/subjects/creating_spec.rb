require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }
  let!(:subject){ create :subject }
  let!(:school){ create :school }

  let(:attrs) do {
      name: 'Latina',
      room: 333
    }
  end

  before do
    login_as user
  end

  it 'should create a new subject' do
    visit new_subject_path
    expect(page).to have_content I18n.t('subjects.new.title')

    fill_in 'subject_name', with: attrs[:name]
    fill_in 'subject_room', with: attrs[:room]
    select('Hill high school', :from => 'subject[school_id]')
    click_button I18n.t('helpers.submit.create')

    subject = Subject.last
    expect(subject.name).to eq attrs[:name]
    expect(subject.room).to eq attrs[:room]
  end
end
