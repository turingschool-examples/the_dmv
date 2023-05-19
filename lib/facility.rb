require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles

  #def initialize(name, address, phone) #<original entry>
  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      @registered_vehicles << vehicle
      vehicle.registration_date = Date.today
      #add plate type and registration fees
      if vehicle.antique?
        vehicle.plate_type = :antique
        vehicle.registration_fee = 25
      elsif vehicle.engine == :ev
        vehicle.plate_type = :ev
        vehicle.registration_fee = 200
      else
        vehicle.plate_type = :regular
        vehicle.registration_fee = 100
      end
    else
      #p "Service not available for this facility"
    end
  end

  def collected_fees #iterate through registered vehicles
    fee_total = 0
    @registered_vehicles.map do |vehicle|
      fee_total += vehicle.registration_fee
    end
    fee_total
  end

  def administer_written_test(registrant)
    if registrant.permit?
      if @services.include?("Written Test")
        #p "Written service available"
        registrant.license_data[:written] = true
      else
        #p "Written Test not available for this facility"
        false
      end
    else
      #p "Permit required"
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test")
      #p "Road Test service available"
      if registrant.license_data[:written] == true
        registrant.license_data[:license] = true
      else
        #p "Successful written test required"
        false
      end
    else
      #p "Road Test not available for this facility"
      false
    end
  end

end
