require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }
  let!(:unicorn){ create :unicorn }
  let!(:kinship){ create :kinship }

  before do
    login_as user
  end

  it 'should create a new unicorn' do
    visit new_unicorn_path
    expect(page).to have_content I18n.t('unicorns.new.title')

    fill_in 'unicorn_first_name', with: 'Liga'
    fill_in 'unicorn_age', with: '3'
    fill_in 'unicorn_horn_length', with: '2'
    fill_in 'unicorn_height', with: '2'
    fill_in 'unicorn_weight', with: '2'
    select('Brad', :from => 'unicorn[kinship_id]')
    click_button 'Create Unicorn'

    unicorn = Unicorn.last
    expect(page).to have_content I18n.t('unicorns.notifications.created')
    expect(unicorn.first_name).to eq 'Liga'
    expect(unicorn.age).to eq 3
    expect(unicorn.horn_length).to eq 2
    expect(unicorn.height).to eq 2
    expect(unicorn.weight).to eq 2
  end
end
