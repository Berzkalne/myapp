require 'spec_helper'

describe 'Create ' do
  let!(:user){ create :user }
  let!(:unicorn){ create :unicorn }
  let!(:future_dream){ create :future_dream, unicorn: unicorn }

  let(:attrs) do {
    name: 'Dancer',
    description: 'hip hop'
  }
  end

  before do
    login_as user
  end

  it 'should create new future dream' do
    visit new_unicorn_future_dream_path(unicorn, future_dream)
    expect(page).to have_content I18n.t('future_dreams.new.title')

    fill_in 'future_dream_name', with: attrs[:name]
    fill_in 'future_dream_description', with: attrs[:description]
    click_button I18n.t('helpers.submit.create')

    future_dream = FutureDream.last
    expect(future_dream.name).to eq attrs[:name]
    expect(future_dream.description).to eq attrs[:description]
  end
end