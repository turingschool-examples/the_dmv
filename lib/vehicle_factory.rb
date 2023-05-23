class VehicleFactory
  # Empty def initialize removed per conversation with Kat.

  # This method is responsible for creating an array of Vehicle objects
  def create_vehicles(data)
    # This maps over the data and creates a new Vehicle object for each element in the array
    data.map do |vehicle_data|
      vin = vehicle_data[:vin_1_10]
      make = vehicle_data[:make]
      model = vehicle_data[:model]
      year = vehicle_data[:model_year]

      # This creates a new Vehicle object and returns it
      Vehicle.new(vin: vin, make: make, model: model, year: year, engine: :ev)
    end
  end
end
