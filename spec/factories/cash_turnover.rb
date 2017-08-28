FactoryGirl.define do 
  factory :cash_turnover do
    state 'unpaid'
    priority '1'
    description 'needs to be paid'
    paid nil
    price ''
  end
end
