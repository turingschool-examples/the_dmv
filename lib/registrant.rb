class Registrant
  attr_reader :age, :name, :permit, :license_data

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {written: false, license: false, renewed: false}
  end

  def permit?
    permit
  end

  def written?
    license_data[:written]
  end

  def license?
    license_data[:license]
  end

  def earn_permit
    @permit = true
  end

  def take_written
    if age > 15 && permit?
      license_data[:written] = true
      true
    else
      false
    end
  end

  def take_road
    if written?
      license_data[:license] = true
      true
    else
      false
    end
  end
end