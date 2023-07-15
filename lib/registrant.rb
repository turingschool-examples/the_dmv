class Registrant
  attr_reader :name, :age, :license

  def initialize(name, age, license = nil)
    @name = name
    @age = age
    @license = nil
  end
end
