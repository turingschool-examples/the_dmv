class Registrant
  attr_reader :name,
              :age

  def initialize(name, age, permit = false)
    @age = age
    @license_data = {
      :written=>false, :license=>false, :renewed=>false
    }
    @name = name
    @permit = permit
  end
end