class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
    [service]
  end


  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.update_registration_date
    # if vehicle.plate_type == :ev
    #   @collected_fees += 200
    # elsif vehicle.plate_type == :antique
    #   @collected_fees += 25
    # else
    #   @collected_fees += 100
    # end
    @collected_fees += collection_fee_assignment[vehicle.plate_type]
    @registered_vehicles
  end

  def collection_fee_assignment
    {
    :ev => 200,
    :antique => 25,
    :regular => 100
    }
  end
  
  



end
