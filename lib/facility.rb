require 'date'
require 'vehicle'

class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0 
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.registration_date = Date.today
      if vehicle.antique? == true
        vehicle.plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle? == true
        vehicle.plate_type = :ev
        @collected_fees += 200
      else 
        vehicle.plate_type = :regular
        @collected_fees += 100
      end
  end

  def administer_written_test(applicant)
    if self.services.include?('Written Test') && applicant.age > 15 && applicant.permit?
        applicant.license_data[:written] = true
    end
  end

  def administer_road_test(applicant)
    if self.services.include?('Road Test') && applicant.license_data[:written] == true
        applicant.license_data[:license] = true
    end
  end
end
