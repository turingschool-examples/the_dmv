class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(registrations)
    registrations.map do |registration|
      new_vehicle = Vehicle.new({
      vin: registration[:vin_1_10],
      year: registration[:model_year],
      make: registration[:make],
      model: registration[:model],
      engine: :ev, county: registration[:county]})
      vehicles << new_vehicle
    end

  end
  
  def create_boats(registrations)
    registrations.map do |registration|
      new_vehicle = Vehicle.new({
      vin: registration[:vin],
      year: registration[:model_year],
      make: registration[:make],
      model: "unknown",
      engine: :BOAT, county: registration[:county]})
      vehicles << new_vehicle
    end
  end

  def popular_make
    make_list = vehicles.map do |vehicle|
      vehicle.make
      end
    make_list.max_by do |make|
      make_list.count(make)
    end
  end

  def popular_model
    model_list = vehicles.map do |vehicle|
      vehicle.model
      end
    model_list.max_by do |model|
      model_list.count(model)
    end
  end
  
  def vehicles_in_year(requested_year)
    year_list = vehicles.map do |vehicle|
      vehicle.year
    end
    year_list.count do |year|
      year == requested_year
    end
  end

  def most_in_county
    county_list = vehicles.map do |vehicle|
      vehicle.county
    end
    county_list.max_by do |county|
      county_list.count(county)
    end
  end
end