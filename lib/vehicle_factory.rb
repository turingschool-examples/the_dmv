class VehicleFactory

   def create_vehicles(registration_data)
      registration_data.map { |vehicle_data| create_vehicle(vehicle_data) }.compact
   end
   
   def create_vehicle(vehicle_data)
      state = vehicle_data[:state] || vehicle_data[:state_of_residence]
      
      if state == "NY"
         vehicle_details = create_ny_vehicle(vehicle_data)
      elsif state == "WA"
         vehicle_details = create_wa_vehicle(vehicle_data)
      else
         "Unsupported state: #{state}"
      end                     
      vehicle_details.nil? ? nil : Vehicle.new(vehicle_details)
   end
   
   def create_ny_vehicle(data)
      return nil if data[:record_type] != "VEH"
      {
        vin_number: data[:vin],
        year: data[:model_year],
        make: data[:make],
        model: data[:body_type],
        engine: data[:fuel_type].to_sym
      }
    end
   
   def create_wa_vehicle(data)
      {
         vin_number: data[:vin_1_10],
         year: data[:model_year],
         make: data[:make],
         model: data[:model],
         engine: :ev
      }
   end
end
