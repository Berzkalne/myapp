require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }
  let!(:subject){ create :subject }
  let!(:school){ create :school }

  before do
    login_as user
  end

  it 'should create a new subject' do
    visit new_subject_path
    expect(page).to have_content I18n.t('subjects.new.title')

    fill_in 'subject_name', with: 'Latina'
    fill_in 'subject_room', with: '333'
    select('Hill high school', :from => 'subject[school_id]')
    click_button 'Create Subject'

    subject = Subject.last
    expect(subject.name).to eq 'Latina'
    expect(subject.room).to eq 333
  end
end
