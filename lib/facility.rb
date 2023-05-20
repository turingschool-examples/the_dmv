class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(data_hash)
    @name = data_hash[:name]
    @address = data_hash[:address]
    @phone = data_hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def collected_fees
  @collected_fees
  end

  def register_vehicle(vehicle)
      if @services.include? 'Vehicle Registration'
      @registered_vehicles << vehicle
      return @registered_vehicles
    end
  end




end
