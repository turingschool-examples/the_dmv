class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registration_date

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def registration_date(vehicle)
    Today.now 
  end

  # def collected_fees(vehicle)
  #   if vehicle.antique? == $25
  #   elsif vehicle.electric_vehicle == $200
  #   else $100
  #   end
  # end
  
  def register_vehicle(vehicle)
    @registration_date == Today.now
    if vehicle.antique? 
      plate_type.antique && collected_fees == $25
      elsif vehicle.ev?
      plate_type.ev? && collected_fees == $200
      else
        collected_fees == $100

    end
    
    # Registration date == Today.now
    # Plate_type = antique, ev, normal
    # Fees = $25, 

  # end



end


#register a vehicle
#Vehicles 25 years and older antiquest, $25
#EV $200
#all other $100

#plate_type = :regular, :antique, or :ev

#administer a written test
#must have permit
#must be 16 or older

#road test
#must have passed written test
#qualify for road test, you have a license

#renew license
#only if you've passed road test and have a license
