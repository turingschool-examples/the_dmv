class Registrant
  attr_reader :name,
              :age,
              :license_data

  def initialize(name, age, permit = false)
    @age = age
    @license_data = {
      :written=>false, :license=>false, :renewed=>false
    }
    @name = name
    @permit = permit
  end

  def permit?
    @permit
  end



end