class Registrant
  attr_reader :name, :age, :permit, :license_data
  attr_accessor :license_data

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = license_data
    assign_license_data
  end

  def permit?
    @permit
  end

  def assign_license_data
    @license_data = {:written=>false, :license=>false, :renewed=>false}
  end

  def earn_permit
    @permit = true
  end

end