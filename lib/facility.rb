require 'pry'
require 'pry-reload'
# require './lib/vehicle'
# require './lib/registrant'

class Facility
  
  # Only Enables Writing (Setting New Values) of Properties, Not Reading
  # attr_writer :name, :address, :phone, :services

  # Enables Both Reading / Writing Properties
  # attr_accessor :name, :address, :phone, :services

  # Only Enables Reading of Properties, Not Writing (Setting New Values)
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees

  def initialize(facility_obj)
    @name = facility_obj[:name]
    @address = facility_obj[:address]
    @phone = facility_obj[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @collected_fees = 0
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      
      if vehicle.antique?
        vehicle.plate_type = :antique
        
        # @collected_fees = @collected_fees + 25
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :ev
        @collected_fees += 200
      else
        vehicle.plate_type = :reqular
        @collected_fees += 100
      end

      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
    end
  end

  def administer_written_test(registrant)  
    if @services.include?('Written Test') && registrant.permit && registrant.age > 16
      registrant.license_data[:written] = true

      return true
    end

    return false
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test')
      registrant.license_data[:license] = true

      return true
    end

    return false
  end
# def renew_drivers_license(registrant)
#   if@services.include?('Renew License')
#     registrant.license_data[:renewed] = true
end

# binding.pry