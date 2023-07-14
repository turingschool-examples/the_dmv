class Registrant
  attr_reader :name,
              :age,
              :permit,
              :license_data,
              :registrant

  def initialize(name, age, permit = false)
    @registrant = registrant
    @name = name
    @age  = age
    @permit = permit
    @license_data = license_data
  end
end