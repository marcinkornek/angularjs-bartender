FactoryGirl.define do
  factory :product_detail do
    # case product.size_type
    # when 'size'
    #   size  %w(small medium large).sample
    # when 'milliliters'
    #   size  %w(300 500 1000).sample
    # when 'grams'
    #   size  %w(300 500 1000).sample
    # end
    size  %w(300 500 1000).sample
    price Faker::Commerce.price
    product
  end
end
