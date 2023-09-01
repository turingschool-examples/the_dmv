class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles
  def initialize(args)
    args.each do |k, v|
    instance_variable_set("@#{k}", v) unless v.nil?
    end
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle_details)
    @registered_vehicles << vehicle_details
    @registration_date = Time.now
    if 
      @registration_date.year - @year >= 25
      return 25
      @plate_type = :antique
    # elsif
    #   @engine == ev
    #   return 200
    #   @plate_type = :ev
    else
      return 100
      @plate_type = :regular
    end
  end
  # Register a vehicle
  # Vehicles have the following rules:
  # Vehicles 25 years old or older are considered antique and cost $25 to register
  # Electric Vehicles (EV) cost $200 to register
  # All other vehicles cost $100 to register
  # A vehicle’s plate_type should be set to :regular, :antique, or :ev upon successful registration.
  def collected_fees
    0
  end
  # Administer a written test
  # A written test can only be administered to registrants with a permit and who are at least 16 years of age
  # Administer a road test
  # A road test can only be administered to registrants who have passed the written test
  # For simplicity’s sake, Registrants who qualify for the road test automatically earn a license
  # Renew a driver’s license
  # A license can only be renewed if the registrant has already passed the road test and earned a license

end
