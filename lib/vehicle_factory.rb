class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end
  
  def create_vehicles(dmv_hash)
    dmv_hash.each do |vehicle|
      new_vehicle = Vehicle.new(vehicle)
      new_vehicle.engine = :ev
      @vehicles << new_vehicle
    end
     @vehicles
  end

  def most_popular_make(vehicle_array)
    unsorted_hash = []
    makes_array = []
    @vehicles.each do |vehicle|
      makes_array << vehicle.make
    end
    makes_array.reduce(Hash.new(0)) do |make, vote|
      make[vote] += 1
      unsorted_hash = make
    end
    sorted = unsorted_hash.sort_by{|x,y| y}.to_h
  end

  def most_popular_model(vehicle_array)
    unsorted_hash = []
    models_array = []
    @vehicles.each do |vehicle|
      models_array << vehicle.model
    end
    models_array.reduce(Hash.new(0)) do |model, vote|
      model[vote] += 1
      unsorted_hash = model
    end
    sorted = unsorted_hash.sort_by{|x,y| y}.to_h
  end

  def wa_county_with_most_registered
      unsorted_hash = []
      county_array = []
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      wa_ev_registrations.each do |vehicle|
        vehicle.each do |key, value|
          if key == :county
            county_array << value
          end
        end
      end
      county_array.reduce(Hash.new(0)) do |county, vote|
        county[vote] += 1
        unsorted_hash = county
    end
    sorted = unsorted_hash.sort_by{|x,y| y}.to_h
  end
end