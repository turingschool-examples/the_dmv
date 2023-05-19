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

    if vehicle.antique? == true
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle? == true
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
    end
  end

 
end
