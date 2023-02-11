class Registrant
  attr_reader :name,
              :age,
              :permit
  def initialize(name, age, permit = false)
    @name = name
    @age = age 
    @permit = permit
  end

  def license_data
    ld = {written: false, license: false, renewed: false}
  end

  def permit?
    @permit
  end

  def earn_permit
    return @permit = true if @age >= 15
  end
end