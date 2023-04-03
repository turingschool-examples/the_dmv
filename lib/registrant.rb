class Registrant


  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {


  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end
end