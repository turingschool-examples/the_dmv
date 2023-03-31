class Registrant
  attr_reader :name, :age, :license_data

  def initialize(name, age, permit = false, license_data = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = license_data
  end

  def permit?
    @permit
  end
  
end