class Registrant 
  attr_accessor :license_data
  attr_reader :name, :age, :permit

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {
      written: false, 
      license: false, 
      renewed: false
      }
  end

  def permit?
    @permit
  end

  def earn_permit
    if @age >= 16
      @permit = true
    end
  end
end