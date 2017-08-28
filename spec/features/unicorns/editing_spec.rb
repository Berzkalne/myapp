require 'spec_helper'

describe 'Edit safe redirecting' do
  let!(:user){ create :user }
  let!(:kinship){ create :kinship }
  let!(:unicorn){ create :unicorn }

  before do
    login_as user
  end

  it 'should edit info about unicorn' do
    visit unicorns_path

  end
end
