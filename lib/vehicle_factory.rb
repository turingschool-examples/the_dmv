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
    elsif data[:state] == "NY"
      if data[:fuel_type] == "GAS"
        :ice
      elsif data[:fuel_type] == "ELECTRIC"
        :ev
      end
    end
  end

  def format_make(data)
    if data[:state_of_residence] == "WA" && data[:electric_vehicle_type] != nil
      data[:make]
    elsif data[:state] == "NY"
      data[:make]
    end
  end

  def format_model(data)
    if data[:state_of_residence] == "WA" && data[:electric_vehicle_type] != nil
      data[:model]
    elsif data[:state] == "NY"
      data[:body_type]
    end
  end

  def format_vin(data)
    if data[:state_of_residence] == "WA" && data[:electric_vehicle_type] != nil
      data[:vin_1_10]
    elsif data[:state] == "NY"
      data[:vin]
    end
  end

  def format_year(data)
    if data[:state_of_residence] == "WA" && data[:electric_vehicle_type] != nil
      data[:model_year]
    elsif data[:state] == "NY"
      data[:model_year]
    end
  end

  def model_count
    grouped_list = vehicles.group_by { |vehicle| vehicle.model }
    counted_list = grouped_list.transform_values { |car| car.count }
    ordered_list = counted_list.sort_by { |make, count| -count }
    # ordered_list[0][0]
  end

  def make_count
    grouped_list = vehicles.group_by { |vehicle| vehicle.make }
    counted_list = grouped_list.transform_values { |vehicle| vehicle.count }
    ordered_list = counted_list.sort_by { |make, count| -count }
    # ordered_list[0][0]
  end

  def model_year_count(year)
    list = vehicles.find_all { |vehicle| vehicle.year == year }
    list.count
  end
end
