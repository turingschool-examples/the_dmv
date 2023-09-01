class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles
  
  def initialize(facility_data)
    @name = facility_data[:name] 
    @address = facility_data[:address] 
    @phone = facility_data[:phone] 
    @services = []
    @registered_vehicles = []
  end
  
  def add_service(service)
    @services << service
  end

  def collected_fees
    @collected_fees = 0
  end

  def register_vehicle(car_type)
    @registered_vehicles << car_type
    car_type.registration_date = Date.today
      if car_type.antique? == true
        car_type.plate_type = :antique
      elsif car_type.engine == :ev
        car_type.plate_type = :ev
      else
        car_type.plate_type = :regular
      end
  end
end
