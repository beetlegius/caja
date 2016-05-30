FactoryGirl.define do
  factory :move do
    ammount { rand(1000.00) }
    kind { Move::KINDS.sample }
    cash
  end
end
