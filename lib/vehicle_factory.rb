class VehicleFactory
  attr_reader :manufactured_vehicles, 
              :manufactured_vehicle_count, 
              :vehicle_data
  def initialize
    @vehicle_data = []
    @manufactured_vehicles = []
    @manufactured_vehicle_count = 0
  end

  def manufacture_vehicles(vehicles)
    @vehicle_data = vehicles
    vehicles.each do |vehicle|
      @manufactured_vehicle_count += 1
      number = @manufactured_vehicle_count
      vehicle_number = Vehicle.new(vehicle)
      if vehicle.has_key?(:vin_1_10) 
        vehicle_number.vin!(vehicle.fetch(:vin_1_10))
        vehicle_number.engine!(:ev)
        vehicle_number.year!(vehicle.fetch(:model_year))
      else
        vehicle_number.vin!(vehicle.fetch(:vin))
        vehicle_number.year!(vehicle.fetch(:model_year))
      end
      @manufactured_vehicles << vehicle_number
    end
  end

  def vehicles_by_zip(number)
    @manufactured_vehicles.select {|vehicle| vehicle.zip == "#{number}" }
  end

  def most_popular_make
    vehicle_makes = []
    @manufactured_vehicles.each {|vehicle| vehicle_makes << vehicle.make}
    vehicle_count = Hash.new(0)
    vehicle_makes.each {|vehicle| vehicle_count[vehicle] += 1}
    vehicle_count.sort_by { |vehicle,number| number}.last[0]
  end
  
  def most_popular_model
    vehicle_models = []
    @manufactured_vehicles.each {|vehicle| vehicle_models << vehicle.model}
    vehicle_count = Hash.new(0)
    vehicle_models.each {|vehicle| vehicle_count[vehicle] += 1}
    vehicle_count.sort_by { |vehicle,number| number}.last[0]
  end

  def count_by_year(year)
    vehicle_years = []
    @manufactured_vehicles.each do |vehicle| 
    if vehicle.year == year
    vehicle_years << vehicle.year
    end
    end
    vehicle_years.length
  end

  def county_with_most_registrations
    vehicle_county = []
    @manufactured_vehicles.each {|vehicle| vehicle_county << vehicle.county}
    vehicle_count = Hash.new(0)
    vehicle_county.each {|vehicle| vehicle_count[vehicle] += 1}
    vehicle_count.sort_by { |vehicle,number| number}.last[0]
  end
end