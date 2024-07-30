# frozen_string_literal: true
require 'iterable'

Iterable.configure do |config|
  config.token = ENV['ITERABLE_API_KEY']
end
