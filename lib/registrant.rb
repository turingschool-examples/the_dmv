class Registrant
  attr_accessor :name,
              :age,
              :permit,
              :license_data
  
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {:written=>false, :license=>false, :renewed=>false}
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end

  def takes_written
    @license_data[:written] = true

  end

  def takes_road
    @license_data[:license] = true

  end

  def is_renewed
    @license_data[:renewed] = true
  end

end


