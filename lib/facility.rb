class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_details)
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

  def registar_vehicle(car)
    if (Date.today.year - car.year) > 25
      car.plate_type = :antique
      @collected_fees += 25
    elsif car.engine == :ev
      car.plate_type = :ev
      @collected_fees += 200
    else
      car.plate_type = :regular
      @collected_fees += 100
    end
    car.registration_date = Date.today
    @registered_vehicles << car
  end
end
