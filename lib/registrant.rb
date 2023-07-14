class Registrant
attr_reader :name, :age, :permit?, :license_data

  def initialize(age, name, permit = false)
    @age = age
    @license_data = {:written, :license, :renewed}
    @name = name
    @permit = permit
    @tested = false
  end
end
