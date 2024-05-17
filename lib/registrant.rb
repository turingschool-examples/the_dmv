class Registrant
  attr_reader :age,
              :name,
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

  def earn_permit
    @permit = true
  end
end
