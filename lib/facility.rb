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
    unless @services.include?(service)
      @services << service
    end
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

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit? && registrant.age >= 16
      registrant.license_data[:written] = true
      
    else
      false
    end
  end

  def administer_road_test(registrant)
    if registrant.license_data[:written] == true
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if registrant.license_data[:written] == true && registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
    else
      false
    end
  end

end
