class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
  end

  
  def add_service(service)
    @services << service
  end
  
  def register_vehicle_helper
    if @registered_vehicles.nil?
      @registered_vehicles = []
    end
  end

  def collected_fees_helper
    if @collected_fees.nil?
      @collected_fees = 0
    end
  end

  def registered_vehicles
    register_vehicle_helper
    @registered_vehicles
  end

  def collected_fees
    collected_fees_helper
    @collected_fees
  end

  def register_vehicle(vehicle)
    register_vehicle_helper
  end

    
end
