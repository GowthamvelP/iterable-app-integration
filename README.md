# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 3.0.3

* Rails version - 7.0.1

* System dependencies - N/A

* Configuration - 
  * checkout the main branch
  * touch .env and copy from .env.example. Replace the API key with your actual iterable.com token
  * bundle install
  * rails generate devise:install 
  * rails generate devise User

* Database creation -
  * rails db:migrate

* Database initialization

* How to run the test suite -
  * bundle exec rails generate rspec:install

* Services (job queues, cache servers, search engines, etc.)
  * In case of additional load, we can bulk track messages from a background job
  * Bulk track events - iterable.com API - POST /api/events/trackBulk

* Deployment instructions

* ...
