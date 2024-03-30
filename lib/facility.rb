class Facility
  attr_reader :name, 
              :phone,
              :address,
              :services,
              :collected_fees,
              :registered_vehicles

  def initialize(facility_details)
    @name = facility_details[:name]
    @phone = facility_details[:phone]
    @address = facility_details[:address]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    if  vehicle.antique? # If vehicle is older than 25 years, it is :antique
      @collected_fees += 25 # Add $25 to @collected_fees
    elsif vehicle.electric_vehicle? # Elsif vehicle = EV
      @collected_fees += 200    # Add $200 to @collected_fees
    else  
      @collected_fees += 100 # Else add $100 to @collected_fees
    end

    def plate_type(vehicle)
      # if # vehicle.antique == true
      #   # vehicle_details{} << antique: vehicle
      # else 
      #   # vehicle_details{} << regular: vehicle
      # end
    end
  end
end

# facility_1
  # Can administer written tests


# Facilities can perform these services:

    # Register a vehicle
      # Vehicles have the following rules:
        # Antique if 25+  = $25
        # EV registration = $200
        # All others      = $100
        # plate_type set to :antique, :regular, or :ev when registered

    # Administer Written Test - MUST:
      # Age = 16+
      # Permit = true

    # Administer Road Test - MUST:
      # Pass written test first
      # Registrants meeting prior requirements only need to take road test to pass

    # License Renewal
      # Applicant can renew if registrant has passed road test 
          # --> (& by default earned a license)
