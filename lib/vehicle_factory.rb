class VehicleFactory
  attr_reader :create_vehicle
  def initalize
  end
  
  def create_vehicle(registrations)
    @create_vehicle = []
    registrations.map do |registration|
      vehicle_details = {vin: registration[:vin_1_10], year: registration[:model_year], make: registration[:make], model: registration[:model], engine: :ev}
      vehicle = Vehicle.new(vehicle_details)
      @create_vehicle << vehicle
    end
    @create_vehicle
  end

  def car_make
    list_make = @create_vehicle.map do |vehicle|
      vehicle.make
    end
    counts = Hash.new 0
    list_make.each do |make|
      counts[make] += 1
    end
    counts.max_by{ |make, value| value }
  end

  def car_model
    list_model = @create_vehicle.map do |vehicle|
      vehicle.model
    end
    counts = Hash.new 0
    list_model.each do |model|
      counts[model] += 1
    end
    counts.max_by{ |model, value| value }
    binding.pry
  end
end