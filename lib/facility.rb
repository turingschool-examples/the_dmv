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
    vehicle.registration_date = Date.today
    registration_fees = 0
    if vehicle.antique?
      registration_fees = 25
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      registration_fees = 200
      vehicle.plate_type = :ev 
    else
      registration_fees = 100
      vehicle.plate_type = :regular
    end

    @registered_vehicles << vehicle
    
    
  end

  
end
