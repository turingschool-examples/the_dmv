class Registrant
  attr_reader :name, :age, :permit, :license_data
  def initialize(name, age, permit = false)
    @age = age
    @license_data = {
      written: false,
      license: false,
      renewed: false,
    }
    @name = name
    @permit = permit
  end

  def earn_permit
    @permit = true
  end

  def permit?
    @permit
  end 
end