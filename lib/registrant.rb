class Registrant
  attr_reader :name, :age, :license_data
  attr_accessor :permit

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {written: false, license: false, renewed: false}
  end

  def earn_permit
    true
  end

  def permit?
    @permit
  end
end