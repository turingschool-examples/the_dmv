require './spec/spec_helper'
require 'date'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(contact_info)
    # Colorado Info
    # DmvDataService (5 x instance[idx]): name => :dmv_office, address => (:address_li,:address__1,:city,:state,:zip),
    # phone => :phone
    @name = contact_info[:dmv_office]
    @address = "#{contact_info[:address_li]}, #{contact_info[:address__1]}, #{contact_info[:city]}, #{contact_info[:state]}, #{contact_info[:zip]}"
    @phone = contact_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.registration_date = Date.today
      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
        @registered_vehicles << vehicle
      elsif vehicle.electric_vehicle?
        vehicle.registration_date = Date.today
        vehicle.plate_type = :ev
        @collected_fees += 200
        @registered_vehicles << vehicle
      else
        vehicle.registration_date = Date.today
        vehicle.plate_type = :regular
        @collected_fees += 100
        @registered_vehicles << vehicle
      end
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit? && registrant.age >= 16
      registrant.license_data[:written] = true
      return true
    else
      return false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.license_data[:written]
      registrant.license_data[:license] = true
      return true
    end
    return false
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && 
      registrant.license_data[:written] && 
      registrant.license_data[:license]
        registrant.license_data[:renewed] = true
        return true
    end
    return false
  end
end

# Create CO facilities
# facilities = DmvDataService.new.co_dmv_office_locations
#   .map do |office|
#     Facility.new(office)
#   end

