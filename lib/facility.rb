require "date"


class Facility
  attr_accessor :name, 
                :address, 
                :phone, 
                :services,
                :hours, 
                :registered_vehicles, 
                :collected_fees

  def initialize(input)
    @name = input[:name]
    @address = input[:address]
    @phone = input[:phone]
    @hours = input[:hours]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
    @services
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    if vehicle.registered == false
      if vehicle.engine == :ev
        @collected_fees += 200
        vehicle.plate_type =:ev
      elsif vehicle.antique? == true
        @collected_fees += 25
        vehicle.plate_type = :antique
      else
        @collected_fees += 100
        vehicle.plate_type = :regular
      end
    @registered_vehicles << vehicle
    vehicle.registered = true
    vehicle
    end
  end

  def administer_written_test(registrant)
    if (@services.include?("Written Test")) && (registrant.age >= (16)) && (registrant.permit? == (true))
      registrant.license_data[:written] = true
          end
    registrant.license_data[:written]
  end

  def administer_road_test(registrant)
    if (@services.include?("Road Test")) && (registrant.license_data[:written] == true)
      registrant.license_data[:license] = true
    end
    registrant.license_data[:license]
  end

  def renew_drivers_license(registrant)
    if (@services.include?("Renew License")) && (registrant.license_data[:license] == true)
      registrant.license_data[:renewed] = true
    end
    registrant.license_data[:renewed]
  end

end
