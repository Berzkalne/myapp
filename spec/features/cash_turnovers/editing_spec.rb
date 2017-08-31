require 'spec_helper'

describe 'Edit safe redirecting' do
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

  it 'should alow to edit info' do
    visit edit_cash_turnover_path(cash_turnover)
    expect(page).to have_content I18n.t('cash_turnovers.edit.title')

    fill_in 'cash_turnover_name', with: attrs[:name]
    fill_in 'cash_turnover_priority', with: attrs[:priority]
    click_button I18n.t('helpers.submit.update')

    cash_turnover.reload
    expect(cash_turnover.name).to eq attrs[:name]
  end
end