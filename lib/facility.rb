require 'date'
require 'vehicle'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.registration_date = Date.today
      if vehicle.antique? == true
        vehicle.plate_type = :antique
      elsif vehicle.electric_vehicle? == true
        vehicle.plate_type = :ev
      else 
        vehicle.plate_type = :regular
      end
  end

  
end
