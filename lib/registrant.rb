class Regristrant
  attr_reader :name,
              :age,
              :permit,
              :license_data

  def initialize(registrant_info)
    @name         = registrant_info[:name]
    @age          = registrant_info[:age]
    @permit       = []
    @license_data = registrant_info[:license_data]
  end

  def has_permit(permit)
    @permit = "True"
  end

  