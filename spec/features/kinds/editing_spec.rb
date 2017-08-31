require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }
  let!(:kind){ create :kind }
  let!(:cash_turnover){ create :cash_turnover }

  let(:attrs) do {
    name: 'school',
    price: 99,
    percent: 2
  }
  end

  before do
    login_as user
  end

  it 'should alow to edit info' do
    visit edit_kind_path(kind)
    expect(page).to have_content I18n.t('kinds.edit.title')

    fill_in 'kind_name', with: attrs[:name]
    fill_in 'kind_price', with: attrs[:price]
    fill_in 'kind_percent', with: attrs[:percent]
    click_button I18n.t('helpers.submit.update')

    kind.reload
    expect(kind.name).to eq attrs[:name]
  end
end