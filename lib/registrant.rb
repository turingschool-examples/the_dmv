class Registrant 
  attr_reader :name, :age, :license_data
  attr_accessor :permit

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = 
    {
      written: false,
      license: false,
      renewed: false
    }
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end

  def administer_written_test(registrant)
    registrant.permit? && registrant.age >= 16
  end
end

# pull test