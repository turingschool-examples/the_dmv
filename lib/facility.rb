class Facility
  attr_accessor :name,
                :address,
                :phone,
                :services,
                :registered_vehicles,
                :collected_fees

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_services(service)
    @services << service
  end

  def register_vehicle(vehicle)
    antique_fee = 25
    ev_fee = 200
    regular_fee = 100
     if vehicle.antique? == true && @services.include?('Vehicle Registration')
      vehicle.registered = true
      vehicle.registration_date = Date.today
      vehicle.plate_type = :antique
      @collected_fees += antique_fee
      @registered_vehicles << vehicle
     elsif vehicle.engine == :ev && @services.include?('Vehicle Registration')
      vehicle.registered = true
      vehicle.registration_date = Date.today
      vehicle.plate_type = :ev
      @collected_fees += ev_fee
      @registered_vehicles << vehicle
     else @services.include?('Vehicle Registration')
      vehicle.registered = true
      vehicle.registration_date = Date.today
      vehicle.plate_type = :regular
      @collected_fees += regular_fee
      @registered_vehicles << vehicle 
    end
    nil
  end

  # def administer_written_test(registrant)
  #   if registrant.age >= 16 && @permit == true
      
  #   end
  # end

end