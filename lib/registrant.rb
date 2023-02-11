class Registrant
  attr_reader :name
  def initialize(name, age, permit = false)
    @name = name 
    @age = age
    @permit = permit
    # @license_data = license_data
  end




end