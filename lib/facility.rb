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
    @registered_vehicles.map do |vehicle|
      if vehicle.plate_type == :antique
        @collected_fees += 25
      elsif vehicle.plate_type == :ev
        @collected_fees += 200
      else vehicle.plate_type == :regular
        @collected_fees += 100
      end
    end
    @collected_fees.to_i
  end

  def register_vehicle(car)
    @registered_vehicles << car
    car.registration_date = Date.today
      if car.antique? == true
        car.plate_type = :antique
      elsif car.engine == :ev
        car.plate_type = :ev
      else
        car.plate_type = :regular
      end
  end
end
