require 'spec_helper'

describe 'Create' do
  let!(:user){ create :user }
  let!(:kind){ create :kind }
  let!(:cash_turnover){ create :cash_turnover }

  let(:attrs) do {
    name: 'Bobby',
    priority: 2,
    description: 'pay for this'
  }
  end

  before do
    login_as user
  end

  it 'should create a new cash turnover' do
    visit new_cash_turnover_path
    expect(page).to have_content I18n.t('cash_turnovers.new.title')

    fill_in 'cash_turnover_name', with: attrs[:name]
    fill_in 'cash_turnover_priority', with: attrs[:priority]
    fill_in 'cash_turnover_description', with: attrs[:description]
    click_button I18n.t('helpers.submit.create')

    cash_turnover = CashTurnover.last
    expect(page).to have_content I18n.t('cash_turnovers.show.title', name: cash_turnover.name)
    expect(cash_turnover.name).to eq attrs[:name]
    expect(cash_turnover.priority).to eq attrs[:priority]
    expect(cash_turnover.description).to eq attrs[:description]
  end
end
