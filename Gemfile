source 'https://rubygems.org'
source 'https://rails-assets.org'
ruby '2.1.4'

gem 'rails', '~> 4.1.7'
gem 'pg'
gem 'roar-rails', '~> 0.1.6' # representer - extends/fits json files
gem 'slim-rails'
gem 'sorcery'
gem 'angular_rails_csrf'
gem 'figaro' #menage application.yml file with secret keys, works with pusher too
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
gem 'omniauth-github', '~> 1.1.2'
gem 'carrierwave'
gem 'rmagick', '2.13.2'
gem 'fog', '~> 1.23.0' # Ruby cloud services library
gem 'newrelic_rpm'

# assets processors
gem 'sass-rails',               '~> 4.0.3'
gem 'uglifier',                 '>= 1.3.0'
gem 'coffee-rails',             '~> 4.0.0'
gem 'coffee-rails-source-maps', '~> 1.4.0'
gem 'execjs',                   '~> 2.1.0'
gem 'ngannotate-rails'
gem 'autoprefixer-rails',       '~> 1.1.0'

# assets
gem 'rails-assets-lodash'
gem 'rails-assets-angular',                       '~> 1.2.0'
gem 'rails-assets-angular-cache'
gem 'rails-assets-angular-animate'
gem 'rails-assets-angular-ui-router',             '~> 0.2.9'
gem 'rails-assets-angular-resource'
gem 'rails-assets-bootstrap'
gem 'rails-assets-angular-bootstrap'
gem 'rails-assets-angular-mocks'
gem 'rails-assets-angular-file-upload'
gem 'rails-assets-angular-gravatar'
gem 'rails-assets-Font-Awesome'

# i18n
# gem 'rails-i18n'
gem 'rails-assets-angular-translate'

group :development, :test do
  gem 'spring'
  gem 'pry-rails' # instead of rails console
  gem 'quiet_assets' #dont show assets in 'rails s' log (it's much more cleaner)
  gem 'rspec-rails', '~> 2.14.0.rc1'
  gem 'faker'
end

# frontend
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'underscore-rails'
gem 'will_paginate', '~> 3.0'

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller' #better_errors gem
  gem "letter_opener"
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
end
