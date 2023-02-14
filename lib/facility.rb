class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  regular_vehicle_fee = 100
  ev_fee = 200
  antique_vehicle_fee = 25

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    if vehicle.engine == :ev
      vehicle.plate_type = :ev
      @collected_fees += ev_fee
    elsif vehicle.age >= 30
      vehicle.plate_type = :antique
      @collected_fees += antique_vehicle_fee
    else
      vehicle.plate_type = :regular_vehicle_fee
      @collected_fees += regular_vehicle_fee
    end

    registered_vehicles << vehicle
  end

  def add_service(service)
    @services << service
  end

  def administer_written_test(registrant)
    
  end
end
