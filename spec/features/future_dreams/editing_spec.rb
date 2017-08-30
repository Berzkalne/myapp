require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }
  let!(:future_dream){ create :future_dream }
  let!(:unicorn){ create :unicorn }

  before do
    login_as user
  end

  it 'should alow to edit info' do
    visit edit_unicorn_future_dream_path(unicorn, future_dream)
    expect(page).to have_content I18n.t('future_dreams.edit.title')

    fill_in 'future_dream_name', with: 'Dancer'
    fill_in 'future_dream_description', with: 'hip hop'
    click_button 'Update Future dream'

    future_dream.reload
    expect(future_dream.name).to eq 'Dancer'
    expect(future_dream.description).to eq 'hip hop'
  end
end