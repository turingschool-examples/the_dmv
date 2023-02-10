class Registrant
  attr_reader :name,
              :age,
              :permit,
              :license_data

  def initialize(name, age, permit = false)
  @name = name
  @age = age
  @permit = permit
  @license_data = {:written=>false, :license=>false, :renewed=>false}
  # @license_data = {}
  # @written = @license_data[:written]
  # @license = @license_data[:license]
  # @renewed = @license_data[:renewed]
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end
end