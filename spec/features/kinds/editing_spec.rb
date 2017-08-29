require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }
  let!(:kind){ create :kind }
  let!(:cash_turnover){ create :cash_turnover }

  before do
    login_as user
  end

  it 'should alow to edit info' do
    visit edit_kind_path(kind)
    expect(page).to have_content I18n.t('kinds.edit.title')

    fill_in 'kind_name', with: 'school'
    fill_in 'kind_price', with: '32'
    fill_in 'kind_percent', with: '3'
    click_button 'Update Kind'

    kind.reload
    expect(kind.name).to eq 'school'
  end
end