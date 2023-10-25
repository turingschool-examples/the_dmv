#Create a Registrant class that has "name, age, permit, and license_data" attributes 
#so our vistors can use services.

class Registrant
  attr_accessor :name, 
                :age, 
                :permit, 
                :license_data

  def initialize(name, age, permit = false)
  @age = age
  @name = name
  @permit = permit
  @license_data = {:written=>false, :license=>false, :renewed=>false}
  end

  def permit?
    @permit
  end
end