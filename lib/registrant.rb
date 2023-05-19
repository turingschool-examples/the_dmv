class Registrant

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @licenst_data = {
      written: false,
      license: false,
      renewed: false
    }
  end
end