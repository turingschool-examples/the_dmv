class Facility
  attr_reader :name, :address, :phone, :services, :facility, :registered_vehicles, :collected_fees

  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @facility = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end
  
  def register_vehicle(vehicle)
    registered_vehicles << vehicle
    vehicle.new_registration_date
    
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

  # def administer_written_test
  #   permit? == true
  #   age >= 16
  # end
end




