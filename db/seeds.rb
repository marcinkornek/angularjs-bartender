if Rails.env.production?
  Category.create!(name: 'food', image: 'https://s3.amazonaws.com/bartender-app-heroku/category_images/food.jpg')
  Category.create!(name: 'drinks', image: 'https://s3.amazonaws.com/bartender-app-heroku/category_images/drink.jpg')
  Category.create!(name: 'snacks', image: 'https://s3.amazonaws.com/bartender-app-heroku/category_images/snack.jpg')
else
  Category.create!(name: 'food', image: 'https://s3.amazonaws.com/bartender-app/category_images/food.jpg')
  Category.create!(name: 'drinks', image: 'https://s3.amazonaws.com/bartender-app/category_images/drink.jpg')
  Category.create!(name: 'snacks', image: 'https://s3.amazonaws.com/bartender-app/category_images/snack.jpg')
end
