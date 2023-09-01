class Registrant 
  attr_accessor :name, :age, :permit, :license_data

  def initialize(name, age, permit = false, license_data = {written: false, license: false, renewed: false})
    @name = name
    @age = age
    @permit = permit
    @license_data = license_data
  end

  def permit?
    if @permit == true
      true
    else 
      false
    end
  end

  def earn_permit
    @permit = true
  end
end