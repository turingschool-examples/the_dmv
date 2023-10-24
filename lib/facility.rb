require 'pry'
require 'date'
require 'faraday'
require 'json'
require './lib/dmv'
require './lib/vehicle'
require './lib/facility'
require './lib/registrant'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  attr_accessor :name, :address, :phone, :services

  def initialize(hash)
    @name = hash[:name]
    @address = hash[:address]
    @phone = hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end
  #refactor
  def register_vehicle(car)
    if services.find {|service| service.include?('Vehicle Registration')}
    current_time = DateTime.now
    cdt = current_time.strftime "%d/%m/%Y %H:%M"
    car.registration_date = cdt
    @registered_vehicles << car

      if Date.today.year - car.year > 25
        car.plate_type = :antique
      elsif Date.today.year - car.year <= 25 && car.engine == :ice
        car.plate_type = :regular
      else
        car.plate_type = :ev
      end

      if car.plate_type == :antique
        @collected_fees += 25
      elsif car.engine == :ev
        @collected_fees += 200
      else
        @collected_fees =+ 100
      end
    else
      nil
    end
  end

  def administer_written_test(name)
    if services.find {|service| service.include?('Written Test')}
      if name.permit == true && name.age >= 16
        name.license_data[:written] = true
        true
      else
        name.permit == false || name.age < 16
        false
      end
    else
      false
    end
  end

  def administer_road_test(name)
    if services.find {|service| service.include?('Road Test')}
      if name.license_data[:written] == true
        name.license_data[:license] = true
        true
      end
    else
      false
    end
  end

  def renew_drivers_license(name)
    if services.find {|service| service.include?('Renew License')}
      if name.license_data[:written] == true && name.license_data[:license] == true
        name.license_data[:renewed] = true
      elsif name.license_data[:written] == false || name.license_data[:license] == false
        name.license_data[:renewed] = false
      end
    else
      false
    end
  end

  def create_facility(list) #filter by something more permanent
    nf_arr = []
    if list.count == 5 || list.find {|omv| omv[:state] == "CO"} #CO
      list.each do |omv|
        new_omv = {
          name: omv[:dmv_office],
          address: omv[:address_li], #+ ", " + omv[:address__1],
          phone: omv[:phone]
        }
        nf_arr << Facility.new(new_omv)
      end
    elsif list.count == 179 || list.find {|omv| omv[:state] == "MO"} #MO
      list.each do |omv|
        new_omv = {
          name: omv[:name],
          address: omv[:address1],
          phone: omv[:phone]
        }
        nf_arr << Facility.new(new_omv)
      end
    elsif list.count == 172 || list.find {|omv| omv[:state] == "NY"} #NY
      list.each do |omv|
        new_omv = {
          name: omv[:office_name],
          address: omv[:street_address_line_1],
          phone: omv[:public_phone_number]
        }
        nf_arr << Facility.new(new_omv)
      end
    else
      p "UNKNOWN DATA SET"
    end
    return nf_arr
  end

  def hours(source)
    if source.find {|omv| omv[:state] == "CO"} #CO
      hour_array = []
      source.each do |omv|
        office_hours = {
          omv[:dmv_office] => omv[:hours]
        }
        hour_array << office_hours
      end
      hour_array
    elsif source.find {|omv| omv[:state] == "NY"} #NY
      hour_array = []
      source.each do |omv|
        office_hours = {
          omv[:office_name] =>
          [omv[:monday_beginning_hours],
          omv[:monday_ending_hours],
          omv[:tuesday_beginning_hours],
          omv[:tuesday_ending_hours],
          omv[:wednesday_beginning_hours],
          omv[:wednesday_ending_hours],
          omv[:thursday_beginning_hours],
          omv[:thursday_ending_hours],
          omv[:friday_beginning_hours],
          omv[:friday_ending_hours]]
        }
        hour_array << office_hours
      end
      hour_array
    elsif source.find {|omv| omv[:state] == "MO"} #MO
      hour_array = []
      source.each do |omv|
        office_hours = {
          omv[:name] => omv[:daysopen]
        }
        hour_array << office_hours
      end
      hour_array
    end
  end

  def holidays(source)
    if source.find {|omv| omv[:state] == "MO"} #MO
      holiday_arr = []
      source.each do |omv|
        holiday_hash = {
          omv[:name] => omv[:holidaysclosed]
        }
        holiday_arr << holiday_hash
      end
      holiday_arr
    else
      "Unknown"
    end
  end
end
