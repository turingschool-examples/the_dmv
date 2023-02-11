class Registrant
  attr_reader :name,
              :age,
              :license_data

  DEFAULTS = {
    license_data: {
      written: false,
      license: false,
      renewed: false
    }
  }.freeze

  def initialize(name, age, has_permit = false)
    @name = name
    @age = age
    @has_permit = has_permit
    @license_data = DEFAULTS[:license_data]
  end

  def permit?
    @has_permit
  end

  def earn_permit
    return false if @age < 16
    @has_permit = true
  end

  def set_license_data(key, value)
    @license_data[key] = value
  end
end
