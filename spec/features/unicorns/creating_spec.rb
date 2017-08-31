require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }
  let!(:unicorn){ create :unicorn }
  let!(:kinship){ create :kinship }

  let(:attrs) do {
    first_name: 'Liga',
    age: 3,
    horn_length: 2,
    height: 2,
    weight: 2
  } 
  end

  before do
    login_as user
  end

  it 'should create a new unicorn' do
    visit new_unicorn_path
    expect(page).to have_content I18n.t('unicorns.new.title')

    fill_in 'unicorn_first_name', with: attrs[:first_name]
    fill_in 'unicorn_age', with: attrs[:age]
    fill_in 'unicorn_horn_length', with: attrs[:horn_length]
    fill_in 'unicorn_height', with: attrs[:height]
    fill_in 'unicorn_weight', with: attrs[:weight]
    select('Brad', :from => 'unicorn[kinship_id]')
    click_button I18n.t('helpers.submit.unicorn.create')

    unicorn = Unicorn.last
    expect(page).to have_content I18n.t('unicorns.notifications.created')
    expect(unicorn.first_name).to eq attrs[:first_name]
    expect(unicorn.age).to eq attrs[:age]
    expect(unicorn.horn_length).to eq attrs[:horn_length]
    expect(unicorn.height).to eq attrs[:height]
    expect(unicorn.weight).to eq attrs[:weight]
  end
end
