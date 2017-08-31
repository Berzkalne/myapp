require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }
  let!(:kinship){ create :kinship }
  let!(:unicorn){ create :unicorn }

  before do
    login_as user
  end

  it 'should display info about all unicorns' do
    visit unicorns_path
    expect(page).to have_content I18n.t('unicorns.index.title')
    expect(page).to have_link unicorn.full_name
  end

  it 'should display new unicorn form' do
    visit unicorns_path
    click_link I18n.t('unicorns.index.new')
    expect(page).to have_content I18n.t('unicorns.new.title')
    expect(page).to have_content "Name"
    expect(page).to have_content "Age"
    expect(page).to have_content "Horn length"
    expect(page).to have_content "Height"
    expect(page).to have_content "Weight"
    expect(page).to have_content "Kinship"
  end

  it 'should display info about unicorn' do
    visit unicorns_path
    click_link unicorn.full_name
    expect(page).to have_content I18n.t('unicorns.show.title', name: unicorn.first_name)
  end
end
