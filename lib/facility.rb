
class Facility
  
  attr_reader :name, :address, :phone, :services, :registered_vehicles,
  :collected_fees

  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @phone = attributes[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end
  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.registration_date = Time.now
      if vehicle.antique?
        @collected_fees += 25
        vehicle.plate_type = :antique
      elsif vehicle.electric_vehicle?
          @collected_fees += 200
          vehicle.plate_type = :ev
      else 
        @collected_fees += 100
        vehicle.plate_type = :regular
        end
      @registered_vehicles << vehicle
    end
  end
  def administer_written_test(registrant)
    if registrant.permit? && registrant.age >= 16
      if @services.include?('Written Test')
        registrant.license_data[:written] = true
        true
      else 
        false
      end
    # else
    #     false
    end
  end
end
