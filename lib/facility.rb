class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end
  

  def add_service(service)
    @services << service
  end
  
  def register_vehicle(model)
    model.registration_date = Date.today
    if model.antique? && !model.electric_vehicle?
      model.plate_type = :antique
      @collected_fees += 25
    elsif model.electric_vehicle?
      model.plate_type = :ev
      @collected_fees += 200
    else
      model.plate_type = :regular
      @collected_fees += 100
    end
    registered_vehicles << model
  end

  
  

  
end
