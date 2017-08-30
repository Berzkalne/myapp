require 'spec_helper'

describe 'Create ' do
  let!(:user){ create :user }
  let!(:future_dream){ create :future_dream }
  let!(:unicorn){ create :unicorn }

  before do
    login_as user
  end

  it 'should create new future dream' do
    visit new_unicorn_future_dream_path(future_dream)
    expect(page).to have_content I18n.t('future_dreams.new.title')

    fill_in 'future_dream_name', with: 'Dancer'
    fill_in 'future_dream_description', with: 'hip hop'
    click_button 'Create Future dream'

    future_dream = FutureDream.last
    expect(future_dream.name).to eq 'Dancer'
    expect(future_dream.description).to eq 'hip hop'
  end
end