class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle
   if @services.include?('Vehicle Registration')
    #set veh registration
    #then, check engine type
      #set plate
      #set fee
      #add to registered vehicles


    # if !@services.include(register_vehicle)
    #   return nil
    # else "okay"
    # end
  end
end
end
