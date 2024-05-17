class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      assign_registration_date(vehicle)
      assign_plate_type(vehicle)
      charge_fee(vehicle)
      @registered_vehicles << vehicle
    end
  end

  def charge_fee(vehicle)
    if vehicle.plate_type == :regular
      @collected_fees += 100
    elsif vehicle.plate_type == :antique
      @collected_fees += 25
    end
  end

  def assign_plate_type(vehicle)
    if vehicle.antique? == false
      vehicle.plate_type = :regular
    elsif vehicle.antique? == true
      vehicle.plate_type = :antique
    end
  end

  def assign_registration_date(vehicle)
    vehicle.registration_date = Date.today
  end
end
