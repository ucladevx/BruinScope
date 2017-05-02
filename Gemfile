source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'

# Use postgreSQL as the database for Active Record
# Documentation: https://deveiate.org/code/pg/
gem 'pg', '~> 0.19.0'

# Use Puma as the app server
gem 'puma', '~> 3.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# User authentication and authorization using Devise
# Documentation: https://github.com/plataformatec/devise
gem 'devise'

# Google Authentication
# Documentation: https://github.com/zquestz/omniauth-google-oauth2
gem "omniauth-google-oauth2"

# Pagination gem for eventual infinite scroll
# Documentation: https://github.com/mislav/will_paginate
gem 'will_paginate', '~> 3.1.0'

# Provides a single Comment model that can be attached to any model with comment threads
# Documentation: https://github.com/elight/acts_as_commentable_with_threading
gem 'acts_as_commentable_with_threading', '~> 2.0.1'

# Provides a simple and extremely flexible way to upload files from Ruby applications
# Documentation: https://github.com/carrierwaveuploader/carrierwave
gem 'carrierwave', '~> 1.0'

# A gem used by CarrierWave to resize images
# Documentation: https://github.com/minimagick/minimagick
gem 'mini_magick', '~> 4.5'

# Voting system for posts
# Documentation: https://github.com/ryanto/acts_as_votable
gem 'acts_as_votable', '~> 0.10.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
