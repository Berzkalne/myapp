require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }
  let!(:kind){ create :kind }
  let!(:cash_turnover){ create :cash_turnover }

  before do
    login_as user
  end

  it 'should alow to edit info' do
    visit edit_cash_turnover_path(cash_turnover)
    expect(page).to have_content I18n.t('cash_turnovers.edit.title')

    fill_in 'cash_turnover_name', with: 'July'
    fill_in 'cash_turnover_priority', with: '3'
    click_button 'Update Cash turnover'

    cash_turnover.reload
    expect(cash_turnover.name).to eq 'July'
  end
end