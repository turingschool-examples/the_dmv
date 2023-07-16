class Facility
  attr_reader :name,
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_details = {})
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def offers_service?(service)
    @service.include?(service)
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
    
      vehicle.registration_date = Date.today
      
      if vehicle.electric_vehicle?
        vehicle.plate_type = :ev
        @collected_fees += 200
      elsif vehicle.antique?
        vehicle.plate_type = :antique 
        @collected_fees += 25
      else
        vehicle.plate_type = :regular 
        @collected_fees += 100
      end
      @registered_vehicles << (vehicle)
    end
  end 

  def administer_written_test()
    ## Only if age >= 16 && have @permit
  end

  def administer_road_test()
    ## To registrants who have passed the written
    ## Registrants automatically get license when qualify for road test
    ## if passed_written_test, earned_license == true
  end

  def renew_drivers_license()
    ## Can be renewed if the registrain has already passed the road test and earned a license
    ## if passed_road_test && earned_license
  end

  
  
end
