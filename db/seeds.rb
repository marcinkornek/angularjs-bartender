food = %w(grilled_salmon grilled_sausage hamburger hot_dog pasta pizza shish_kebab steak)
drinks = %w(energy_black energy_bullit energy_monster energy_red_bull energy_tiger mirinda mountain_dew sprint sprite)
alcohol = %w(beer_heineken beer_lomza beer_redds_lemon beer_redds_raspberry beer_tatra beer_tyskie_gronie beer_tyskie_klasyczne beer_warka beer_warka_strong beer_zubr beer_żywiec_jasne)
snacks = %w(chips_lays_barbecue chips_lays_classic chips_lays_fromage chips_lays_green_onion chips_lays_paprica peanuts pretzels salty_sticks)

sizes = %w(small medium large)
sizes_ml = %w(250 500 1000)
sizes_gr = %w(100 200 400)

if Rails.env.production?
  p '-------make food---------'
  food.each do |n|
    product = Product.new(category: 'food', size_type: 'size', name: n.humanize)
    sizes.each do |s|
      product.remote_image_url = 'https://s3.amazonaws.com/bartender-app-heroku/product_images/food/food_'+n.downcase+'.jpg'
      ProductDetail.create!(size: s, price: rand(5..50), product: product)
    end
  end
  p '-------make drinks---------'
  drinks.each do |n|
    product = Product.new(category: 'drinks', size_type: 'milliliters', name: n.humanize)
    sizes_ml.each do |s|
      product.remote_image_url = 'https://s3.amazonaws.com/bartender-app-heroku/product_images/drinks/drinks_'+n.downcase+'.jpg'
      ProductDetail.create!(size: s, price: rand(5..50), product: product)
    end
  end
  p '-------make alcohol---------'
  alcohol.each do |n|
    product = Product.new(category: 'alcohol', size_type: 'milliliters', name: n.humanize)
    sizes_ml.each do |s|
      product.remote_image_url = 'https://s3.amazonaws.com/bartender-app-heroku/product_images/alcohol/alcohol_'+n.downcase+'.jpg'
      ProductDetail.create!(size: s, price: rand(5..50), product: product)
    end
  end
  p '-------make snacks---------'
  snacks.each do |n|
    product = Product.new(category: 'snacks', size_type: 'grams', name: n.humanize)
    sizes_gr.each do |s|
      product.remote_image_url = 'https://s3.amazonaws.com/bartender-app-heroku/product_images/snacks/snacks_'+n.downcase+'.jpg'
      ProductDetail.create!(size: s, price: rand(5..50), product: product)
    end
  end

else
  p '-------make food---------'
  food.each do |n|
    product = Product.new(category: 'food', size_type: 'size', name: n.humanize, description: Faker::Lorem.sentence)
    sizes.each do |s|
      product.image = File.open('/home/mars/ruby/bar_pic/food/food_'+n.downcase+'.jpg')
      ProductDetail.create!(size: s, price: Faker::Commerce.price, product: product)
    end
  end
  p '-------make drinks---------'
  drinks.each do |n|
    product = Product.new(category: 'drinks', size_type: 'milliliters', name: n.humanize, description: Faker::Lorem.sentence)
    sizes_ml.each do |s|
      product.image = File.open('/home/mars/ruby/bar_pic/drinks/drinks_'+n.downcase+'.jpg')
      ProductDetail.create!(size: s, price: Faker::Commerce.price, product: product)
    end
  end
  p '-------make alcohol---------'
  alcohol.each do |n|
    product = Product.new(category: 'alcohol', size_type: 'milliliters', name: n.humanize, description: Faker::Lorem.sentence)
    sizes_ml.each do |s|
      product.image = File.open('/home/mars/ruby/bar_pic/alcohol/alcohol_'+n.downcase+'.jpg')
      ProductDetail.create!(size: s, price: Faker::Commerce.price, product: product)
    end
  end
  p '-------make snacks---------'
  snacks.each do |n|
    product = Product.new(category: 'snacks', size_type: 'grams', name: n.humanize, description: Faker::Lorem.sentence)
    sizes_gr.each do |s|
      product.image = File.open('/home/mars/ruby/bar_pic/snacks/snacks_'+n.downcase+'.jpg')
      ProductDetail.create!(size: s, price: Faker::Commerce.price, product: product)
    end
  end
end
