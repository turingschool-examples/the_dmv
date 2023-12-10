class Registrant 
  attr_reader :name, :age, :permit, :license_data

  def initialize(name, age, permit = false)
    @name = name 
    @age = age 
    @permit = permit 
    @license_data = details[:license_data] 
  end

  def method 
    #text
  end


end