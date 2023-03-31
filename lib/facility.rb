class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def administer_written_test(person)
    if @services.include?("Written Test") && person.permit?
      person.license_data[:written] = true
      true
    else
      false
    end
  end

  def register_vehicle(car)
    if @services.include?("Vehicle Registration")
      @registered_vehicles << car
      car.registration_date = Date.today
      car.plate_type!
      if car.plate_type == :regular
        @collected_fees += 100
      elsif car.plate_type == :antique
        @collected_fees += 25
      elsif car.plate_type == :ev
        @collected_fees += 200
      end 
      @registered_vehicles
    else
      nil
    end
  end
end
