class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :collected_fees,
              :registered_vehicles

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle) 
    if @services.include? 'Vehicle Registration'
      @registered_vehicles << vehicle
      collect_fee(vehicle)
      vehicle.register
      vehicle.get_plate
    end
  end

  def collect_fee(vehicle)
    if vehicle.electric_vehicle?
      @collected_fees += 200
    elsif vehicle.antique?
      @collected_fees += 25
    else 
      @collected_fees += 100
    end
  end

  def administer_written_test(registrant)
    if @services.include? 'Written Test'
      registrant.pass_written_test
    end
  end

  def administer_road_test(registrant)
    if @services.include? 'Road Test'
      registrant.pass_road_test
    end
  end

  def renew_license(registrant)
    if @services.include? 'Renew License'
      registrant.renew_license
    end
  end
end
