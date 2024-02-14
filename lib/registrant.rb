require "./spec/spec_helper"

# The Registrant class represents a single person and their license data.
# This includes their name, age, and whether they have a driving permit,
# driver's license, and whether their license has been renewed.
# Syntax:
#
# registrant = Registrant.new({name: "Bill", age: 18})
#
# Methods:
#
# registrant.earn_permit
# registrant.permit?
class Registrant
  attr_reader :name, :age, :permit
  attr_accessor :license_data

  def initialize(info)
    @name = info[:name]
    @age = info[:age]
    @permit = info[:permit] || false
    @license_data = { written: false, license: false, renewed: false }
    return if info[:license_data].nil?

    info[:license_data].each_pair { |key, value| @license_data[key] = value }
  end

  def earn_permit
    @permit = @age >= 16
  end

  def permit?
    @permit
  end
end
