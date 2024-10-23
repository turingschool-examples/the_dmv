class Registrant
 
  attr_reader :name, :age
  attr_accessor :permit, :license_data

  def initialize(name, age, permit=true)
    @name = name
    @age = age
    @permit = permit
    @license_data = license_data
  end
end