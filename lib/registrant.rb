class Registrant
  attr_reader :name, :age, :permit, :license_data
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = build_license_data_hash
  end

  def permit?
    @permit
  end

  def build_license_data_hash
   license_hash = {
    :written=>false, 
    :license=>false, 
    :renewed=>false
    }
  end

  def earn_permit
    @permit = true
  end
end