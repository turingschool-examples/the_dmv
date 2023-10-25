#require './lib/vehicle'

class Registrant
  attr_reader :name, :age, :permit, :license_data
  def initialize(name_input, age_input, permit_input = false)
    @name = name_input
    @age = age_input
    @permit = permit_input
    @license_data = {:written=>false, :license=>false, :renewed=>false}
  end

  def permit?
    @permit
  end
end
