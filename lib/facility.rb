class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :r_vehicles,
              :total

  def initialize (information, services = [])
    @name = information[:name]
    @address = information[:address]
    @phone = information[:phone]
    @services = services
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
      r_vehicles << vehicle
        if vehicle.vehicle_type == :antique
          @total += 25
          @r_vehicles
        elsif vehicle.vehicle_type == :ev
          @total += 200
          @r_vehicles
        elsif vehicle.vehicle_type == :regular 
          @total += 100
          @r_vehicles
        end
    else
      nil
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test')
      if registrant.age >= 16 && registrant.permit == true
        registrant.license_data[:written] = true
      else
        false
      end
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test')
      if registrant.license_data[:written] == true
        registrant.license_data[:license] = true
      else
        false
      end
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License')
      if registrant.license_data[:license] == true
        registrant.license_data[:renewed] = true
      else
        false
      end
    else
      false
    end
  end
end
