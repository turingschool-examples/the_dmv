class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @registration_date = "#<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>"
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def registered_vehicles
    @registered_vehicles
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    @registration_date = "#<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>"
    if 
      vehicle.year <= 1998
      @collected_fees += 25
    elsif
      :engine == :ev
      @collected_fees += 200
    else
      @collected_fees += 100
    end
    @registered_vehicles
  end



  # def registration_date
  #   "#<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>"
  #   # if 
  #     # nil
  #   # else
  #     # "#<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>"
  #   # end

  # end

  def collected_fees
    @collected_fees
  end

  # def plate_type
  #   plate_type = @registered_vehicles.each do |vehicle|
  #   if vehicle.antique?
  #     :antique
  #   elsif vehicle.electric_vehicle?
  #     :ev
  #   else
  #     :regular
  #   end
  # end
  # plate_type
  # end

  # def administer_written_test
  #   if facility offers 'Written Test' service
  #     and
  #   if registrant.permit? == true and @age >= 16
  #   end
  # end

# Administer a written test:

#   A written test can only be administered to registrants with a permit and who are at least 16 years of age

end #final


# Now that we have our new Registrant class, lets add some functionality to our Facility class so a specific DMV facility can administer services to our registrants.

# The DMV allows facilities to perform the following services:

# Register a vehicle

# Vehicles have the following rules:

#   Vehicles 25 years old or older are considered antique and cost $25 to register
#   Electric Vehicles (EV) cost $200 to register
#   All other vehicles cost $100 to register
#   A vehicle’s plate_type should be set to :regular, :antique, or :ev upon successful registration.





# Administer a road test:

#   A road test can only be administered to registrants who have passed the written test

#   For simplicity’s sake, Registrants who qualify for the road test automatically earn a license


# Renew a driver’s license:

#   A license can only be renewed if the registrant has already passed the road test and earned a license


# NOTE: A facility must offer a service in order to perform it. Just because the DMV allows facilities to perform certain services, does not mean that every facility provides every service.