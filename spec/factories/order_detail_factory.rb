FactoryGirl.define do
  factory :order_detail do
    amount 10
    price  20
    size_type 'size'
    size 'small'
    order
    product
  end
end
