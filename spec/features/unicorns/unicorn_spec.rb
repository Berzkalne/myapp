require 'spec_helper'

describe 'Show safe redirecting' do
  let!(:user){ create :user }
  let!(:kinship){ create :kinship }
  let!(:unicorn){ create :unicorn }
  let!(:future_dream){ create :future_dream }

  before do
    login_as user
  end

  it 'should display new unicorn form' do
    visit unicorns_path
    click_link I18n.t('unicorns.index.new')
    expect(page).to have_content I18n.t('unicorns.new.title')
  end

   it 'should display info about unicorn' do
    visit unicorns_path
    click_link unicorn.first_name
    expect(page).to have_content I18n.t('unicorns.show.title', name: unicorn.first_name)
  end

  it 'should display edit unicorn form' do
    visit unicorn_path(unicorn)
    click_link I18n.t('unicorns.show.edit')
    expect(page).to have_content I18n.t('unicorns.edit.title')
  end

  it 'should display new future dream form' do
    visit unicorn_path(unicorn)
    click_link I18n.t('unicorns.show.new_dream')
    expect(page).to have_content I18n.t('future_dreams.new.title')
  end
end

