require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }
  let!(:kind){ create :kind }
  let!(:cash_turnover){ create :cash_turnover }

  before do
    login_as user
  end

  it 'should create a new cash turnover' do
    visit new_cash_turnover_path
    expect(page).to have_content I18n.t('cash_turnovers.new.title')

    fill_in 'cash_turnover_name', with: 'Bobby'
    fill_in 'cash_turnover_priority', with: '5'
    fill_in 'cash_turnover_description', with: 'pay fot this'
    click_button 'Create Cash turnover'

    cash_turnover = CashTurnover.last
    expect(page).to have_content I18n.t('cash_turnovers.show.title', name: cash_turnover.name)
    expect(cash_turnover.name).to eq 'Bobby'
    expect(cash_turnover.priority).to eq 5
    expect(cash_turnover.description).to eq 'pay fot this'
  end
end
