require 'date'
require_relative 'vehicle.rb'
require_relative 'registrant.rb'

class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @registered_vehicles = []
    @collected_fees = 0
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    if @registration_date == nil
      vehicle.registration_date = DateTime.now
    end
    if vehicle.antique?
      @collected_fees += 25
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
      vehicle.plate_type = :ev
    else
      @collected_fees += 100
      vehicle.plate_type = :regular
    end
  end

  def plate_type_for_vehicle(vehicle)
    return vehicle.plate_type
  end

  def registered_vehicles
    @registered_vehicles
  end

  def collected_fees
    @collected_fees
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') == false
      return false
    elsif registrant.permit? == false
      return false
    elsif registrant.age < 16
      return false
    else @services.include?('Written Test') and registrant.permit? == true
      registrant.license_data = { written: true, license: false, renewed: false }
      return true
    end
  end


end
