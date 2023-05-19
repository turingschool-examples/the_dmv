class Registrant

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_date = {
      written: false,
      license: false,
      renewed: false
    }
  end
end