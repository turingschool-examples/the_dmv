class Registrant

  attr_reader :name,
              :age,
              :permit,
              :license_data,

  def initialize(name, age, permit = nil)
       @name = name
       @age = age
       @permit = permit
       @license_data

end