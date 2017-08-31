require 'spec_helper'

describe 'Show safe redirecting' do
  let!(:user){ create :user }
  let!(:kinship){ create :kinship }
  let!(:unicorn){ create :unicorn }
  let!(:future_dream){ create :future_dream }

  before do
    login_as user
  end

  it 'should display info about unicorn' do
    visit unicorns_path
    click_link unicorn.full_name
    expect(page).to have_content unicorn.horn_length
    expect(page).to have_link I18n.t('unicorns.show.edit')
    expect(page).to have_content I18n.t('unicorns.show.title', name: unicorn.first_name)
    expect(page).to have_content unicorn.age
    expect(page).to have_content unicorn.weight
    expect(page).to have_content unicorn.height
    expect(page).to have_content I18n.t('unicorns.show.destroy')
    end
  it 'should display edit unicorn form' do
  visit unicorn_path(unicorn)
    click_link I18n.t('unicorns.show.edit')
    expect(page).to have_content I18n.t('unicorns.edit.title')
    expect(page).to have_content "Name"
    expect(page).to have_content "Age"
    expect(page).to have_content "Horn length"
    expect(page).to have_content "Height"
    expect(page).to have_content "Weight"
    expect(page).to have_content "Kinship"
  end
end
