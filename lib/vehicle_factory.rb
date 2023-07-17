class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(database)
    database.each do |vehicle|
      @vehicles << Vehicle.new({
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        county: vehicle[:county],
        engine: :ev
      })
    end
    @vehicles
  end

  def top_make
    makes_count = @vehicles.map {|vehicle| vehicle.make}.tally
    makes_count.key(makes_count.values.max)
  end

  def top_model
    models_count = @vehicles.map {|vehicle| vehicle.model}.tally
    models_count.key(models_count.values.max)
  end

  def model_year_count(year)
    years_count = @vehicles.map {|vehicle| vehicle.year}.tally
    years_count[year.to_s]
  end
end