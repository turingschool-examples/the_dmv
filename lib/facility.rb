class Facility
  attr_reader :address,
              :collected_fees,
              :name,
              :phone,
              :registered_vehicles, 
              :services

  def initialize(contact_info)
    @contact_info = contact_info
    @address = contact_info[:address]
    @collected_fees = 0
    @name = contact_info[:name]
    @phone = contact_info[:phone]
    @registered_vehicles = []
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.registration_date = Time.now

    if vehicle.antique? 
      vehicle.plate_type = :antique 
      @collected_fees += 25
    elsif vehicle.electric_vehicle? 
      vehicle.plate_type = :ev 
      @collected_fees += 200
    else
      vehicle.plate_type = :regular 
      @collected_fees += 100
    end
  end

 
end
