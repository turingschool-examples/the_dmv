class FacilityFactory

  def create_facilities_oregon(facility_database)

    vehicle_instances = []
    vehicle_database.each do |vehicle|
      vehicle_instances.push(Vehicle.new({vin: vehicle[:vin_1_10], year: vehicle[:model_year], make: vehicle[:make], model:  vehicle[:model], engine: :ev}))
    end
    vehicle_instances
  end
end