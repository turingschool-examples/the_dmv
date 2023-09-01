class Facility
  attr_reader :name, :address, :phone
  attr_accessor :services, :registered_vehicles
  def initialize(args)
    args.each do |k, v|
    instance_variable_set("@#{k}", v) unless v.nil?
    end
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.registration_date = Date.today.year
    if @services.include?('Vehicle Registration') == false
      return nil
    elsif vehicle.antique? == true
      @collected_fees += 25
      vehicle.plate_type = :antique
     elsif
       vehicle.electric_vehicle? == true
       @collected_fees += 200
       vehicle.plate_type = :ev
    else
      @collected_fees += 100
      vehicle.plate_type = :regular
    end
  end

  # Register a vehicle
  # Vehicles have the following rules:
  # Vehicles 25 years old or older are considered antique and cost $25 to register
  # Electric Vehicles (EV) cost $200 to register
  # All other vehicles cost $100 to register
  # A vehicle’s plate_type should be set to :regular, :antique, or :ev upon successful registration.
  def collected_fees
    return @collected_fees
  end
  #require 'pry';binding.pry
  def administer_written_test(registrant)
    if @services.include?('Written Test') == false
      return false
    elsif
      registrant.age >= 16 && registrant.permit? == true
      registrant.license_data[:written] = true
      return true
    else
      false
    end
  end
# Administer a written test
  # A written test can only be administered to registrants with a permit and who are at least 16 years of age
  def administer_road_test(registrant)
    if @services.include?('Road Test') == false
      return false
    elsif 
      registrant.license_data[:written] == true
      registrant.license_data[:license] = true
      return true
    else
      false
    end
  end
  # Administer a road test
  # A road test can only be administered to registrants who have passed the written test
  # For simplicity’s sake, Registrants who qualify for the road test automatically earn a license
 
  def renew_drivers_license(registrant)
    if registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
    else
      false
    end
  end
  # Renew a driver’s license
  # A license can only be renewed if the registrant has already passed the road test and earned a license
end
  

