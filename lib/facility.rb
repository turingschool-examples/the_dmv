require './spec/spec_helper'
require 'date'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_data=nil)
    @name = facility_data ? set_name(facility_data, facility_data[:state]) : nil
    @address = facility_data ? set_address(facility_data, facility_data[:state]) : nil
    @phone = facility_data ? set_phone(facility_data, facility_data[:state]) : nil
    @hours = facility_data ? set_hours(facility_data, facility_data[:state]) : nil
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def set_name(facility, state)
    if facility[:state] == "CO"
      @name = facility[:dmv_office]
    elsif state == "MO" || state == nil
      @name = facility[:name]
    else
      @name = facility[:office_name]
    end
  end

  def set_address(facility, state)
    if state == "CO"
      if facility.keys.to_s.include?('address__1')
        @address = "#{facility[:address_li]}, #{facility[:address__1]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zip]}"
      else
        @address = "#{facility[:address_li]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zip]}"
      end
    elsif state == "MO"
      @address = "#{facility[:address1]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zipcode]}"
    elsif state == "NY"
      @address = "#{facility[:street_address_line_1]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zip_code]}"
    elsif state == nil
      @address = "#{facility[:address]}"
    else
      @addres = nil
    end
  end

  def set_phone(facility, state)
    if state == "CO"
      @phone = facility[:phone]
    elsif state == "MO"
      if facility[:phone]
        @phone = facility[:phone]
      else
        @phone = "n/a"
      end
    elsif state == "NY"
      if facility[:public_phone_number]
        char_arr = facility[:public_phone_number].split("")
        phone_formatted = "(#{char_arr[0..2].join}) #{char_arr[3..5].join("")}-#{char_arr[6..9].join("")}"
      else
        'n/a'
      end
    elsif state == nil
      @phone = facility[:phone]
    else
      @phone = 'n/a'
    end
  end

  def set_hours(facility, state)
    def get_branch_hours(facility)
      hour_arr = []
      facility.each do |key, val|
        if key.to_s.include?('hours')
          hour_arr.push("#{key.to_s.gsub("_"," ")} - #{val}")
        end
      end
      @hours = hour_arr
    end

    if state == "CO"
      @hours = facility[:hours]
    elsif state == "MO"
      @hours = facility[:daysopen]
    elsif state == "NY"
      @hours = get_branch_hours(facility).join(", ")
    else
      @hours = nil
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