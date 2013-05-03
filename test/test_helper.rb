require 'minitest/autorun'
require_relative '../lib/mongoid_encryption'

class MockModel
  include Mongoid::Document
end

Mongoid.configure do |config|
  config.connect_to 'test-mongoid_encryption'
end