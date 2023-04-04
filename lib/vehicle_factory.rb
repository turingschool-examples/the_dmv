require 'spec_helper'

class VehicleFactory

  def initialize
    
  end

  def create_vehicles(data)
   new_vehicles =  data.map do |vehicle|
      Vehicle.new(
        {
        vin: vehicle[:vin_1_10], 
        year: vehicle[:model_year], 
        make: vehicle[:make], 
        model: vehicle[:model], 
        engine: :ev,
        registration_date: vehicle[:registration_date] ||= "N/A"
        }
      )
    end
    new_vehicles
  end

end