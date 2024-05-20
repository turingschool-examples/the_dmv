class Facility
  require 'date'
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


end
