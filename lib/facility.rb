require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_data)
    @name = facility_data[:name]
    @address = facility_data[:address]
    @phone = facility_data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(model)
    if @services.include?('Vehicle Registration')
      unless registered_vehicles.include?(model)
        registered_vehicles << model
        registration_date = Date.today
    
        if model.electric_vehicle?
          @collected_fees += 200
        elsif model.antique?
          @collected_fees += 25
        else
          @collected_fees += 100
        end
      end
    end
    registered_vehicles
  end
end
