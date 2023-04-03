class Registrant
  attr_reader :name,
              :age,
              :permit,
              :license_data

  def initialize(registrant, permit = false)
    @name         = registrant[:name]
    @age          = registrant[:age]
    @permit       = permit
    #@license_data = registrant[:license_data]
  end

  def permit?
    @permit = true
  end
end


