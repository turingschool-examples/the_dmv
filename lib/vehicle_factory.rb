class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end

  def create_vehicles(data)
    if data == DmvDataService.new.wa_ev_registrations
      washington_vehicle_factory(data)
    elsif data = DmvDataService.new.ny_vehicle_registrations
      new_york_vehicle_factory(data)
    end
  end

  def washington_vehicle_factory(data)
    @vehicles = data.map do |vehicle|
      new_vehicle = Vehicle.new({
        vin: vehicle[:"vin_1_10"], 
        year: vehicle[:"model_year"].to_i, 
        make: vehicle[:"make"], 
        model: vehicle[:"model"], 
        engine: :ev
      })
    end
  end

  def new_york_vehicle_factory(data)
    @vehicles = data.map do |vehicle|
      new_vehicle = Vehicle.new({
        vin: vehicle[:"vin"], 
        year: vehicle[:"model_year"].to_i, 
        make: vehicle[:"make"], 
        vehicle_type: vehicle[:"record_type"], 
        engine: vehicle[:"fuel_type"]
      })
    end
  end

  def most_popular_makes_model
    all_makes_models = @vehicles.map { |vehicle| { make: vehicle.make, model: vehicle.model } }
    makes_models_tally = all_makes_models.tally
    raw_most_popular = makes_models_tally.sort_by { |k, v| v }.reverse.shift(1)
    most_popular = raw_most_popular[0][0]
    return "#{most_popular[:make]} #{most_popular[:model]}".rstrip
  end

  def registrations_for_model_year(model_year)
    selected_vehicles = @vehicles.select { |vehicle| vehicle.year == model_year }
    count = selected_vehicles.count
  end

  def most_registered_by_county(data)
    counties = data.map { |vehicle| vehicle[:"county"] }
    top_county = counties.tally.first
    top_county[0]
  end
end