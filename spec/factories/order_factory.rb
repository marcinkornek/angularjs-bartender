FactoryGirl.define do
  factory :order do
    association :bartender, factory: :user
  end
end
