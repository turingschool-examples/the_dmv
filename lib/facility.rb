class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(kwargs)
    @name = kwargs[:name]
    @address = kwargs[:address]
    @phone = kwargs[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      plate_type = vehicle.register

      case plate_type
      when :regular
        @collected_fees += 100
      when :antique
        @collected_fees += 25
      when :ev
        @collected_fees += 200
      end

      return @registered_vehicles << vehicle
    else
      return nil
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.permit? && registrant.age >= 16
      registrant.pass_written_test
      return true
    else
      return false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.passed_written?
      registrant.pass_road_test
      return true
    else
      return false
    end
  end
end
