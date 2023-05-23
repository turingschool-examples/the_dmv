class Registrant
  attr_reader :name,
              :age,
              :license_data

  def initialize(name, age, permit = false)
    @age = age
    @license_data = {
      :written=>false, :license=>false, :renewed=>false
    }
    @name = name
    @permit = permit
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end

  def take_written_test
    license_data[:written] = true
  end

  def take_road_test
    license_data[:license] = true
  end

  def have_license_renewed
    license_data[:renewed] = true
  end
end