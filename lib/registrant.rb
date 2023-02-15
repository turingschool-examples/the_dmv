class Registrant
  attr_reader :name, :age, :permit
  attr_accessor :license_data
  def initialize(name, age, permit = false)
    @name = name 
    @age = age
    @permit = permit
    @license_data = {written: false, license: false, renewed: false} ## setting license_data to the default hash values
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true if @age >= 15 ## give registrant permit if they are 15 or older
  end






end