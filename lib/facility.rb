class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @collected_fees = 0
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      registration_fee = registration_fee(vehicle)
      @collected_fees += registration_fee
      @registration_date = Date.today
      update_plate_type(vehicle)
      @registered_vehicles << vehicle
      
    else
      nil
    end
  end

  def update_plate_type(vehicle)
    if Date.today.year - vehicle.year >= 25
      @plate_type = 'antique'
    elsif vehicle.engine == :ev
      @plate_type = 'electric'
    else
      @plate_type = 'regular'
    end
  end

  def registration_fee(vehicle)
    if Date.today.year - vehicle.year > 25
      25
    elsif vehicle.engine == :ev
      200
    else
      100
    end
  end
end

