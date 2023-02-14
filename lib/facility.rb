
class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
    return [service]
  end

  def register_vehicle(model)
    if services.include?('Vehicle Registration')
      time = Time.now.to_s
      date = []
      date << time.split.first
      model.registration_date = date
      registered_vehicles << model

      if model.plate_type == :regular
        @collected_fees += 100
      elsif model.plate_type == :antique
        @collected_fees += 25
      else
        @collected_fees += 200
      end
      return registered_vehicles
    else
      return nil
    end
  end

  def administer_written_test(registrant)
    if services.include?('Written Test') && registrant.permit? == true
      registrant.license_data[:written] = true
      return registrant.license_data[:written]
    else
      return false
    end
  end

  def administer_road_test(registrant)
    if services.include?('Road Test') && registrant.permit? == true
      registrant.license_data[:license] = true
      return registrant.license_data[:license]
    else
      return false
    end
  end
  
  # require 'pry'; binding.pry
end
