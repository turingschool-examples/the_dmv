class Facility
  attr_reader :address, 
              :phone, 
              :add_service, 
              :registered_vehicles, 
              :collected_fees, 
              :administer_written_test
              :daily_hours
              :holidays_closed
              :daily_open_hours
              :closed_for_the_holidays
  attr_accessor :services, :name
  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @daily_hours = facility_info[:daily_hours]
    @holidays_closed = facility_info[:holidays_closed]
    @zipcode = facility_info[:zipcode]
  end

  def daily_open_hours
    @daily_hours
  end

  def closed_for_the_holidays
    @holidays_closed
  end

  def add_service(service)
    @services << service
    @services
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      @registered_vehicles << vehicle
      vehicle.registration_date = Date.today
      determine_plates_and_fees(vehicle)
      @registered_vehicles
    else 
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && (registrant.permit?)
      registrant.license_data[:written] = true
      return true
    end
    false
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
      return true
    end
    false
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License") && registrant.license_data[:license] == true 
      registrant.license_data[:renewed] = true
      return true
    end
    false
  end

  ## Helper Method
  def determine_plates_and_fees(vehicle)
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
  end
end
