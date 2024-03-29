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
      registration_fee(vehicle)
      # @collected_fees += registration_fee
      vehicle.registration_date = Date.today
      update_plate_type(vehicle)
      update_registered_vehicles(vehicle)
      
    else
      nil
    end
  end

  def update_registered_vehicles(vehicle)
    @registered_vehicles << vehicle

  end

  def update_plate_type(vehicle)
    if vehicle.antique?
      vehicle.plate_type = 'antique'
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = 'electric'
    else
      vehicle.plate_type = 'regular'
    end
  end

  def registration_fee(vehicle)
    if vehicle.antique?
      @collected_fees = 25
    elsif vehicle.electric_vehicle?
      @collected_fees = 200
    else
      @collected_fees = 100
    end
  end
end

