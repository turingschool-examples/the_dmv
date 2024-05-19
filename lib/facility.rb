class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles

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

  def plate_type
    if vehicle.antique? == true
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle? == true
      vehicle.plate_type = :ev
    else 
      vehicle.plate_type = :regular
    end

  end

  def register_vehicle(vehicle)
    if @facilities_offering_service("Register Vehicles") == true

      vehicle.registration_date = Date.today

      plate_type      
      
      @registered_vehicles << vehicle

      facility.collected_fees += 100
    else
      print "This Facility Does Not Offer This Service"

    end

  end
end
