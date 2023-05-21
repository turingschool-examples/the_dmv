class Facility
  attr_reader :address,
              :name,
              :phone,
              :services,
              :collected_fees, 
              :registered_vehicles

  def initialize(office)
    @address = office[:address]
    @name = office[:name]
    @phone = office[:phone]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      vehicle.registration_date = Date.today.year
      @registered_vehicles << vehicle
      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :ev
        @collected_fees += 200
      else
        vehicle.plate_type = :regular
        @collected_fees += 100
      end
    else
      p "Facility does not currently offer this service."
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.age >= 16 && registrant.permit?
      registrant.license_data[:written] = true
    elsif @services.include?("Written Test") && registrant.age < 16
      p "Sorry, the registrant is not old enough to take the written test."
    elsif @services.include?("Written Test") && registrant.permit? == false
      p "Registrant has not yet earned permit."
    else
      p "Facility does not currently offer this service."
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
    elsif @services.include?("Road Test") && registrant.license_data[:written] == false
      p "Registrant must first pass written exam before being administered road test."
    else
      p "Facility does not currently offer this service."
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License") && registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
    elsif @services.include?("Renew License") && registrant.license_data[:license] == false
      p "Registrant must first obtain a license for it to be renewed."
    else
      p "Facility does not currently offer this service."
    end
  end
end
