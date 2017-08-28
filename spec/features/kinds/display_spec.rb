require 'spec_helper'

describe 'Index safe redirecting' do
  let!(:user){ create :user }
  let!(:kind){ create :kind }
  let!(:cash_turnover){ create :cash_turnover }

  before do
    login_as user
  end

  it 'should display info about kinds' do
    visit kinds_path
    expect(page).to have_content kind.name
    expect(page).to have_content kind.price
    expect(page).to have_content I18n.t('kinds.index.title')
  end
end
