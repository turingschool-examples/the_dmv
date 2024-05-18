class VehicleFactory
  def create_vehicle(registrations)
    registrations.map do |registration|
     Vehicle.new(
      engine: :ev,
      make: registration[:make],
      model: registration[:model],
      vin: registration[:vin_1_10],
      year: registration[:model_year],
      registration_date: registration[:registration_date],
      plate_type: registration[:plate_type])
     end
  end 
end