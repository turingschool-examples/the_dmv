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
end