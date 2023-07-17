require "./lib/vehicle.rb"
require "./lib/registrant.rb"

class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if vehicle.antique? == true
      registration_fee = 25
      vehicle.plate_type = :antique 
    elsif vehicle.electric_vehicle? == true
      registration_fee = 200
      vehicle.plate_type = :ev
    else 
      registration_fee = 100
      vehicle.plate_type = :regular
    end
  end
    # will likely need to add a value to change the @registration_date later

  def administer_written_test(registrant)
    if @services.include?("Written Test") == true
      if registrant.age >= 16 && registrant.permit == true
        registrant.license_data[:written] = true
      else 
        false
      end
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") == true
      if registrant.license_data[:written] == true
        registrant.license_data[:license] = true
      else 
        false
      end
    else
      false
    end
  end
#     Administer a road test
# A road test can only be administered to registrants who have passed the written test
# For simplicity’s sake, Registrants who qualify for the road test automatically earn a license

  def renew_drivers_license(registrant)
    if @services.include?("Renew License") == true
      if registrant.license_data[:license] == true
        registrant.license_data[:renewed] = true
      else
        false
      end
    else
      false
    end
  end

end