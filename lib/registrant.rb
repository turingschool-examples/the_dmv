class Registrant
  attr_reader :name,
              :age,
              :permit,
              :license_data,
              :registrant

  def initialize(name, age, permit = false)
    @registrant = registrant
    @name = name
    @age  = age
    @permit = permit
    @license_data = {:written=>false, :license=>false, :renewed=>false}
  end

  def permit? 
    @permit
  end

  def earn_permit 
    @permit = true
  end
end