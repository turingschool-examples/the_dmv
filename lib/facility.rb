require './spec/spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/vehicle'
require 'date'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_data)
    # New York
    @name = parse_data(facility_data)
    @address = parse_data(facility_data)
    @phone = parse_data(facility_data)
    @services = []
    @registered_vehicles = []
    @collected_fees = 0

    # Colorado Info
    # DmvDataService (5 x instance[idx]): name => :dmv_office, address => (:address_li,:address__1,:city,:state,:zip),
    # phone => :phone
    # @name = contact_info[:dmv_office]
    # @address = "#{contact_info[:address_li]}, #{contact_info[:address__1]}, #{contact_info[:city]}, #{contact_info[:state]}, #{contact_info[:zip]}"
    # @phone = contact_info[:phone]
    # @services = []
    # @registered_vehicles = []
    # @collected_fees = 0
  end

  def parse_data(facility_data)
    if facility_data[:state] == "CO"
      @name = facility_data[:dmv_office]
      @address = "#{facility_data[:address_li]}, #{facility_data[:address__1]}, #{facility_data[:city]}, #{facility_data[:state]}, #{facility_data[:zip]}"
      @phone = facility_data[:phone]
    elsif facility_data[:state] == "NY"
      @name = facility_data[:office_name]
      @address = "#{facility_data[:street_address_line_1]}, #{facility_data[:city]}, #{facility_data[:state]}, #{facility_data[:zip_code]}"
      @phone = facility_data[:public_phone_number]
    end
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

# dds_co = DmvDataService.new.co_dmv_office_locations
# dds_ny = DmvDataService.new.ny_dmv_office_locations
# dds_mo = DmvDataService.new.mo_dmv_office_locations
# dds_wa = DmvDataService.new.wa_ev_registrations

# facilities_co = dds_co.map do |facility|
#   Facility.new(facility)
# end
# facilities_ny = dds_ny.map do |facility|
#   Facility.new(facility)
# end
# facilities_ny.each do |facility|
#   facility.add_service('Vehicle_Registration')
# end
# vehicles = VehicleFactory.new.create_vehicles(dds_wa)
1000.times do 
  facilities_co.sample.register_vehicle(vehicles.sample)
end
binding.pry
# Create CO facilities
# facilities = DmvDataService.new.co_dmv_office_locations
#   .map do |office|
#     Facility.new(office)
#   end

# CO Info
# DmvDataService (5 x instance[idx])
# name => :dmv_office
# address => (:address_li, :address__1, :city, :state, :zip)
# phone => :phone
# services => :services_p

# NY Info
# name => :office_name
# address => :street_address_line_1, :city, :state, :zip_code
# phone => :public_phone_number
# services => n/a??

# MO Info
# name => :name
# address => :address1, :city, :state, :zipcode
# phone => :phone
# services => n/a??
