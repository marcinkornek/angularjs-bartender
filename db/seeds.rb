# if Rails.env.production?
#   Category.create!(name: 'food', image: 'https://s3.amazonaws.com/bartender-app-heroku/category_images/food.jpg')
#   Category.create!(name: 'drinks', image: 'https://s3.amazonaws.com/bartender-app-heroku/category_images/drink.jpg')
#   Category.create!(name: 'snacks', image: 'https://s3.amazonaws.com/bartender-app-heroku/category_images/snack.jpg')
# else
#   Category.create!(name: 'food', image: 'https://s3.amazonaws.com/bartender-app/category_images/food.jpg')
#   Category.create!(name: 'drinks', image: 'https://s3.amazonaws.com/bartender-app/category_images/drink.jpg')
#   Category.create!(name: 'snacks', image: 'https://s3.amazonaws.com/bartender-app/category_images/snack.jpg')
# end

# if Rails.env.production?
# else
#   Product.create!(category: 'food', product_type: 'size', name: 'grilled salmon', size: 'small', price: '9.99', description: '-')
#   Product.last.image= File.open('/home/mars/ruby/bar_pic/food/food_grilled_salmon.jpg')
#   Product.last.save!
# end
