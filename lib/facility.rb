class Facility
  attr_reader :name,
              :address,
              :phone,
              :hours,
              :holidays_closed,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(branch_info)
    @name = branch_info[:name]
    @address = branch_info[:address]
    @phone = branch_info[:phone]
    @hours = branch_info[:hours]
    @holidays_closed = branch_info[:holidays_closed]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if vehicle.registered?
    else
      registered_vehicles << vehicle
      vehicle.update_registration_date
      vehicle.update_plate_type
      add_collected_fees(vehicle)
    end
  end

  def add_collected_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end

  def has_service?(service)
    services.include?(service)
  end

  def administer_written_test(registrant)
    if has_service?('Written Test')
      registrant.take_written
    else
      false
    end
  end

  def administer_road_test(registrant)
    if has_service?('Road Test')
      registrant.take_road
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if has_service?('Renew License')
      registrant.renew_license
    else
      false
    end
  end
end