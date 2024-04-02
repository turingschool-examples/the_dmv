class Facility
  attr_reader :name, 
              :phone,
              :address,
              :services,
              :collected_fees,
              :registered_vehicles,
              :administer_written_test

  def initialize(facility_details)
    @name = facility_details[:name]
    @phone = facility_details[:phone]
    @address = facility_details[:address]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if services.include?("Vehicle Registration")
      @registered_vehicles << vehicle
      vehicle.set_date
      if  vehicle.antique? # If vehicle is older than 25 years, it is :antique
        @collected_fees += 25 # Add $25 to @collected_fees
        vehicle.set_plate(:antique)
      elsif vehicle.electric_vehicle? # Elsif vehicle = EV
        @collected_fees += 200    # Add $200 to @collected_fees
        vehicle.set_plate(:ev)
      else
        @collected_fees += 100 # Else add $100 to @collected_fees
        vehicle.set_plate(:regular)
      end
    end
  end



# Administer a written test
# A written test can only be administered to registrants with a permit and who are at least 16 years of age

  def administer_written_test(registrant)
    if services.include?("Written Test")
      if registrant.permit? && registrant.age >= 16
        registrant.license_data[:written] = true
      else
        false
      end
      # if reg has permit and is >= 16 they can take written test
    else
      false
    end
  end

  def administer_road_test(registrant)
    false
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
