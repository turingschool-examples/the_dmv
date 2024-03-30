require 'date'

class Facility

  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees


  def initialize(args)
    @name = args[:name]
    @address = args[:address]
    @phone = args[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration') 
      
      if vehicle.antique?
        cost = 25
        plate_type = :antique
      elsif vehicle.electric_vehicle?
        cost = 200
        plate_type = :ev
      else
        cost = 100
        plate_type = :regular
      end

    vehicle.set_plate_type(plate_type)
    vehicle.set_registration_date(Date.today)
    @collected_fees += cost
    @registered_vehicles << vehicle
    end
  end 

  
  def vehicle_registered?(vehicle)
    @registered_vehicles.include?(vehicle)
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test')
      registrant.license_data[:written] = true
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test')
      registrant.license_data[:license] = true
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Road Test')
      registrant.license_data[:renewed] = true
    end
  end


  # def collected_fees
  #     total_cost = 0
  #     @registered_vehicles.each do |key, vehicle_info|
  #       total_cost += vehicle_info[:cost]
  #   end 
  #   total_cost
  # end

end
