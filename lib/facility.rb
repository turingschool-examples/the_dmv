class Facility
  attr_reader :services, :name, :address, :phone, :year
  #attr_accessor :plate_type

  facility_info = {:name => "name",
                  :address => "address",
                  :phone => "phone",
                  :year => "year"}
  
  # #plate_type = {:regular => :regular, 
  #               :antique => :antique, 
  #               :ev => :ev}
  
  
  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @registrant = "registrant"
    @services = []
    @year = facility_info[:year] || 0
  end

  def add_service(service)
    @services << service
  end

  
  
  def register_vehicle(registrant, vehicle)
    fee = vehicle_registration_fee(vehicle)
    
    if fee == 25
      registrant.earn_permit if vehicle.antique?
      vehicle.plate_type = :antique
    elsif fee == 200
      registrant.earn_permit if vehicle.electric_vehicle?
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
    end
    
    registrant.add_vehicle(vehicle)
  end
  
  def vehicle_registration_fee(vehicle)
    if vehicle.antique?
      25
    elsif vehicle.electric_vehicle?
      200
    else
      100
    end
  end
  
end

private

def plate_type(registrant, vehicle, fee)
  if fee == 25
    registrant.earn_permit if vehicle.antique?
    vehicle.plate_type = :antique
  elsif fee == 200
    registrant.earn_permit if vehicle.electric_vehicle?
    vehicle.plate_type = :ev
  else
    vehicle.plate_type = :regular
  end
end