# Gemfile
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

# 最小限のgemだけを含む
gem 'rails', '~> 6.1.7'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'

# API関連
gem 'jbuilder', '~> 2.7'
gem 'rack-cors'

# 認証関連
gem 'devise'
gem 'devise-jwt'

# API文書
gem 'rswag-api'
gem 'rswag-ui'
gem 'rswag-specs'

# その他
gem 'bootsnap', '>= 1.4.4', require: false
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'dotenv-rails'  # 環境変数管理
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring', '4.2.1'
end
gem "jsonapi-serializer", "~> 2.2"
