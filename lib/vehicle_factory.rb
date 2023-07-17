class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(registrations)
    registrations.each do |vehicle|
      details = {
      engine: format_engine(vehicle),
      make: format_make(vehicle),
      model: format_model(vehicle),
      vin: format_vin(vehicle),
      year: format_year(vehicle)
      }
    @vehicles << Vehicle.new(details)
    end
  end

  def format_engine(data)
    if data[:state_of_residence] == "WA" && data[:electric_vehicle_type] != nil
      :ev
    end
  end

  def format_make(data)
    if data[:state_of_residence] == "WA" && data[:electric_vehicle_type] != nil
      data[:make]
    end
  end

  def format_model(data)
    if data[:state_of_residence] == "WA" && data[:electric_vehicle_type] != nil
      data[:model]
    end
  end

  def format_vin(data)
    if data[:state_of_residence] == "WA" && data[:electric_vehicle_type] != nil
      data[:vin_1_10]
    end
  end

  def format_year(data)
    if data[:state_of_residence] == "WA" && data[:electric_vehicle_type] != nil
      data[:model_year]
    end
  end
end
