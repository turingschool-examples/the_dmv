require 'rspec'
require 'pry'

class Registrant 
  attr_reader :age, 
              :license_data, 
              :name,
              :permit,
              :road_test

  def initialize(name, age, permit = false)
    @age = age
    @license_data = {
      written: false,
      license: false,
      renewed: false
    }
    @name = name
    @permit = permit
    @road_test = false
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end

  def road_test=(passed)
    @road_test = passed
  end

end