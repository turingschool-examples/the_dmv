class Registrant
  attr_reader :age, :license_data, :name, :permit
  
  def initialize(name, age, permit = false, 
    license_data = { written: false, license: false, renewed: false })

    @age = age
    @name = name
    @permit = permit
    @license_data = license_data
  end

  def permit?
    return @permit
  end

  def earn_permit
    @permit = true
  return @permit
  end
end