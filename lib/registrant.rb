require 'rspec'
require 'pry'

class Registrant 
  attr_reader :age, 
              :license_data, 
              :name,
              :permit

  def initialize(name, age, permit = false)
    @age = age
    @license_data = {
      written: false,
      license: false,
      renewed: false
    }
    @name = name
    @permit = permit
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end

end