class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(database)
    #engine = ev
    #make = :make
    #model = :model
    #plate_type = nil
    #registration_date = nil
    #vin = :vin_1_10
    #year = :model_year

    database.each do |vehicle|
      @vehicles << @vehicle = Vehicle.new({
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev
      })
    end

    @vehicles
  end
end