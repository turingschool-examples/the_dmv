class Facility
  require 'date'
  require 'pry'
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  # VEHICLE REGISTRATION
  def assign_plate_type(vehicle)
    if vehicle.antique? == true
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle? == true
      vehicle.plate_type = :ev
    else 
      vehicle.plate_type = :regular
    end
  end
  

  def fees_due(vehicle)
    if vehicle.plate_type == :antique
      @collected_fees += 25
    elsif vehicle.plate_type == :ev
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end

  def register_vehicle(vehicle)
    if @services.include?("Register Vehicles")
      vehicle.registration_date = Date.today
      assign_plate_type(vehicle)
      
      @registered_vehicles << vehicle
      fees_due(vehicle)
      
    else
      print "This Facility Does Not Offer This Service"
    end
  end

  #DRIVER'S LICENSE

  #WRITTEN TEST

  def drivers_license_test_prerequisites(registrant)
    if registrant.permit? == true && registrant.age >= 16
      true
    end
  end

  def administer_written_test?(registrant)
    if @services.include?("Written Test") && drivers_license_test_prerequisites(registrant) == true
      registrant.license_data[:written] = true
    else
      registrant.license_data[:written] = false
    end
  end

  #ROAD TEST

  def administer_road_test?(registrant)
    if  @services.include?("Road Test") && administer_written_test?(registrant) == true
      registrant.license_data[:license] = true
    else
      false
    end
  end
  
  #RENEW LICENSE

  def renew_drivers_license?(registrant)
    if @services.include?("Renew License") && registrant.license_data[:license] = true
      registrant.license_data[:renewed] = true
    else
      false
    end
  end


end
