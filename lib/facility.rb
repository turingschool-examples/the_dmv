class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize(hash, collected_fees = 0)
    @name = hash[:name]
    @address = hash[:address]
    @phone = hash[:phone]
    @services = []
    @collected_fees = collected_fees
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

   def register_vehicle(vehicle)
      @registered_vehicles << vehicle
   end

   


end
