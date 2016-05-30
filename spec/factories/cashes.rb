FactoryGirl.define do
  factory :cash do
    sequence(:name) { |i| "Cash ##{i}" }
  end
end
