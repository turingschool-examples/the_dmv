class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registration_dates,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registration_dates = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end  

  def register_a_vehicle(registered_vehicle)
    @registered_vehicles << registered_vehicle
    
    service_fee = case @plate_type
                  when :antique
                    25
                  when :ev
                    200
                  else
                    100
                  end
    collected_fees(service_fee)
  end

  def collected_fees(service_fee = 0)
    @collected_fees += service_fee
  end
end
  # def collected_fees
  #   if antique? == true
  #     puts 25
  #   elsif electric_vehicle == true
  #     puts 200
  #   else
  #     100
  #   end
  # end


