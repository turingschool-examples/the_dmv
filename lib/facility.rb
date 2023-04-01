require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :collected_fees,
              :registered_vehicles

  def initialize(facility_details)
    @name                = facility_details[:name]
    @address             = facility_details[:address]
    @phone               = facility_details[:phone]
    @services            = []
    @collected_fees      = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if vehicle.year >= 25 && vehicle.engine == :ice
      # require 'pry'; binding.pry
      @collected_fees += 25
      @plate_type = :antique 
      @registered_vehicles << vehicle
      @registration_date = DateTime.now
      return vehicle
    elsif vehicle[:year] < 25 && vehicle[:engine] == :ev
      @collected_fees += 200
      @plate_type = :ev
      @registered_vehicles << vehicle
      @registration_date = DateTime.now
      return vehicle
    elsif vehicle[:year] < 25 && vehicle[:engine] == :ice
      @collected_fees += 100
      @plate_type = :regular
      @registered_vehicles << vehicle
      @registration_date = DateTime.now
      return vehicle
    end
  end


end
