FactoryGirl.define do
  factory :product do
    name          Faker::Lorem.word
    description   Faker::Lorem.sentence
    category      %w(food drinks alcohol snacks).sample
    size_type     %w(milliliters grams size).sample
    image         { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'drink_beer_heineken.jpg')) }
  end
end
