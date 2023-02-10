class Registrant
  attr_reader :name,
              :age,
              :license_data

  def initialize(name, age, has_permit = false)
    @name = name
    @age = age
    @has_permit = has_permit
    @license_data = {
      written: false,
      license: false,
      renewed: false
    }
  end

  def permit?
    @has_permit
  end
end
