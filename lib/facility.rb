require './lib/dmv'
require './lib/facility'
require './lib/vehicle'
require './lib/dmv_data_service'


class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_details)
    @address = facility_details[:address]
    @collected_fees = 0
    @name = facility_details[:name]
    @phone = facility_details[:phone]
    @registered_vehicles = []
    @services = [] 
    
  end

  def add_service(service)
    @services << service
  end

  
  def register_vehicle(vehicle)
    vehicle.change_plate
    vehicle.change_date
    @registered_vehicles << vehicle
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
    
  end
  
  def administer_written_test(registrant)
    if @services.include?('Written Test') == true && registrant.permit? ==true && registrant.age >=16
      true
      registrant.write_test
    else 
      false 
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') == true && registrant.test_written? ==true 
      true
      registrant.road_test
    else 
      false 
    end
  end

  def renew_drivers_licence(registrant)
    if @services.include?('Renew Licence') == true && registrant.road_test? == true 
      true
      registrant.renew_licence
    else 
      false 
    end
  end
end
