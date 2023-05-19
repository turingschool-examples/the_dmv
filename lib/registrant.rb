class Registrant

  attr_reader :name,
              :age,
              :permit,
              :license_data

  def initialize(name, age, permit = false, license_data = nil)
    @name = name
    @age = age
    @permit = permit
    @license_data = license_data
  end
end