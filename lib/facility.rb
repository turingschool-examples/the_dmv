class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(branch_info)
    @name = branch_info[:name]
    @address = branch_info[:address]
    @phone = branch_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      if !@registered_vehicles.include?(vehicle)
      assign_plate(vehicle)
      assign_registration(vehicle)
      collect_fees(vehicle)
      @registered_vehicles << vehicle
      end
    end
  end

  def assign_plate(vehicle)
    if vehicle.antique?
      vehicle.plate_type = :antique
    else
      if vehicle.engine == :ice
        vehicle.plate_type = :regular
      else
        vehicle.plate_type = :ev
      end
    end
  end

  def assign_registration(vehicle)
    vehicle.registration_date = Date.today
  end

  def collect_fees(vehicle)
    fees = {
      regular: 100,
      antique: 25,
      ev: 200
    }
    fee = fees[vehicle.plate_type]
    @collected_fees += fee
  end

end
