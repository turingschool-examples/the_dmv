class Registrant
  attr_reader :name, :age
  attr_accessor :license_data, :permit

  def initialize(name, age, license_data)
    @name = name
    @age = age
    @written = license_data[written]
    @license = license_data[license]
    @reneweed = license_data[renewed]
    @permit = @permit 
  end

end