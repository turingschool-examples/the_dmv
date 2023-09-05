require './spec/spec_helper'
require './lib/dmv_data_service'
require './lib/facility_factory'
require './lib/vehicle'
require './lib/vehicle_factory'
require 'date'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_data=nil)
    @name = parser = 
    @address = parse_data(facility_data)
    @phone = parse_data(facility_data)
    @hours = parse_data(facility_data)
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  class Parser
    def initialize(facility_data)
      @facility_data = facility_data
    end
    def get_colo_bname
      name = @facility
    end 
  end

  def parse_data(facility_data)
    if facility_data
      if facility_data[:state] == "CO"
        @name = facility_data[:dmv_office]
        if facility_data[:address__1]
          @address = "#{facility_data[:address_li]}, #{facility_data[:address__1]}, #{facility_data[:city]}, #{facility_data[:state]}, #{facility_data[:zip]}"
        else
          @address = "#{facility_data[:address_li]}, #{facility_data[:city]}, #{facility_data[:state]}, #{facility_data[:zip]}"
        end
        @phone = facility_data[:phone]
      elsif facility_data[:state] == "NY"
        @name = facility_data[:office_name]
        @address = "#{facility_data[:street_address_line_1]}, #{facility_data[:city]}, #{facility_data[:state]}, #{facility_data[:zip_code]}"
        @phone = facility_data[:public_phone_number]
      elsif facility_data[:state] == "MO"
        @name = facility_data[:name]
        @address = "#{facility_data[:address1]}, #{facility_data[:city]}, #{facility_data[:state]}, #{facility_data[:zipcode]}"
        @phone = facility_data[:phone]
      else
        @name = facility_data[:name]
        @address = facility_data[:address]
        @phone = facility_data[:phone]
      end
    else
      @name = nil
      @address = nil
      @phone = nil
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

# create all Colorado facilities

# co_facilities = FacilityFactory.new.create_facilities(DmvDataService.new.co_dmv_office_locations)
# mo_facilities = FacilityFactory.new.create_facilities(DmvDataService.new.mo_dmv_office_locations)
# ny_facilities = FacilityFactory.new.create_facilities(DmvDataService.new.ny_dmv_office_locations)
# require 'pry'; binding.pry
# co_facilities.each do |facility|
#   facility.add_service('Vehicle Registration')
# end

# ny_facilities.each do |facility|
#   facility.add_service('Vehicle Registration')
# end

# mo_facilities.each do |facility|
#   facility.add_service('Vehicle Registration')
# end

# vehicles = VehicleFactory.new.create_vehicles(DmvDataService.new.wa_ev_registrations)

# vehicles.each do |vehicle|
#   co_facilities.sample.register_vehicle(vehicle)
#   ny_facilities.sample.register_vehicle(vehicle)
#   mo_facilities.sample.register_vehicle(vehicle)
# end
# require 'pry'; binding.pry
# require 'pry'; binding.pry
# CO Info
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
# binding.pry