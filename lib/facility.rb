class Facility
  attr_reader :name, :address, :phone, :services

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
      @plate_type = 
      @registered_vehicles << vehicle
      
    else
      nil
    end
  end

  def update_plate_type(vehicle)
    if vehicle[:year] 
  end

  def registration_fee(vehicle)

  end
end
