require 'date'

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
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end

  def registered_vehicles
    @registered_vehicles
  end

  #NEED TO ADD $25 PER ANTIQUE, 200 PER EV, AND 100 PER NORMAL VEHICLE
  #SET PLATE TO :REGULAR, :ANTIQUE, :OR EV ON SUCCESSFUL REGISTRATION
  #def collect_fees(fee_amount)
  #  @collected_fees += fee_amount
  #return @collected_fees
  #end

  def collected_fees
    @collected_fees
  end

end
