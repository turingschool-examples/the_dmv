class Registrant
  attr_reader :name, :age, :permit, :license_data

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = { written: false, license: false, renewed: false }
  end

  def earn_permit
    @permit = true
  end

  def permit?
    @permit
  end

  def administer_written_test
    @license_data[:written] = true
  end

  def written_test?
    @license_data[:written]
  end

  def administer_road_test
    @license_data[:license] = true
  end

  def road_test?
    @license_data[:license]
  end

  def renew_drivers_license
    @license_data[:renewed] = true
  end

  def renewed_drivers_license?
    @license_data[:renewed]
  end
end
