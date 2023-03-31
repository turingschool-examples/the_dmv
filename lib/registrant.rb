class Registrant
  attr_reader :name, :age, :permit, :license_data

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {
      written: false,
      license: false,
      renewed: false
    }
  end
  
  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end

  def written?
    @license_data[:written]
  end

  def license?
    @license_data[:license]
  end

  def renewed?
    @license_data[:renewed]
  end

end