class Registrant
  def initialize(name, age, permit = false )
    @name = name
    @age = age
    @permit = false
    @license_data = {:written=>false, :license=>false, :renewed=>false}

  end
end