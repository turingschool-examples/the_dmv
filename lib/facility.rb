class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registration_dates,
              :registered_vehicles

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registration_dates = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end  

  def registered_vehicles(registered_vehicle)
    @registered_vehicles << registered_vehicle
  end

  def collected_fees
    if antique
      puts 25
    elsif electric_vehicle
      puts 200
    else
      100
    end
  end

end
