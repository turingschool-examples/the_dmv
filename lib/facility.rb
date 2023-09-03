class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
               :r_vehicle,
               :total

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @r_vehicles = []
    @total = 0
  end

  def add_service(service)
    @services << service
  end

  def registered_vehicles 
    @r_vehicles
  end 

  def collected_fees
    @total
  end


def register_vehicle(vehicle)
  if @services.include?('Vehicle Registration')
    vehicle.registration_date = Date.today 
    @r_vehicles << vehicle
    if vehicle.vehicle_type == :antique
      @total += 25 
      @r_vehicles 
    elsif vehicle.vehicle_type == :ev 
      @total += 200
      @r_vehicles 
    elsif vehicle.vehicle_type == :regular
      @total += 100
      @r_vehicles 
     # binding.pry
    end 
  else  
      nil 
   end 
  end 
end 