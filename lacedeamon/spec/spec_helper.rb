  require 'rspec'
  require 'pry'
  require 'httparty'


  RSpec.configure do |config|
    config.color = true
    config.tty = true
    config.formatter = :documentation
  end
