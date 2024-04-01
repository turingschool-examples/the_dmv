class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees
  

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end


  def register_vehicle(automobile)
    if @services.include?('Vehicle Registration')
    automobile.registration_date = Date.today
    @registered_vehicles << automobile
      if automobile.antique? == true
        automobile.plate_type = :antique
        @collected_fees += 25
      elsif automobile.electric_vehicle? == true
        automobile.plate_type = :ev
        @collected_fees += 200
      else
        automobile.plate_type = :regular
        @collected_fees += 100
      end
    else
    end
  end
end


#  #I have access to facilities :name, 
#               # :address, 
#               # :phone, 
#               # :services,
#               # :registered_vehicles,
#               # :collected_fees
#     # I also have access to automobile
    
#     # When i register a vehicle, I want the vehicles registration_date updated,
#     automobile.registration_date = Date.ordinal(2024,76)
#     # the vehicles plate_type updated, 
#           automobile.plate_type = :regular
#     # the facilities collected_fees updated, 
#           @collected_fees = 100

#     # and have the vehicle included in the facilities list of registered vehicles
#           @registered_vehicles << automobile