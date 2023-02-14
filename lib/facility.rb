require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees,
              :facility_count,
              :facility_list,
              :zip,
              :hours,
              :holidaysclosed

  def initialize(information)
    @name = information.fetch(:name)
    @address = information.fetch(:address)
    @phone = information.fetch(:phone)
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
    @facility_list = []
    @facility_count = 0
    @zip = information[:zip]
    @hours = information[:daysopen]
    @holidaysclosed = information[:holidaysclosed]
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      if vehicle.registration_date.nil?
        vehicle.registration_date = Date.today
        if Date.today.year - vehicle.year > 25
          @collected_fees += 25
        elsif vehicle.engine == :ev
          @collected_fees += 200
        else
          @collected_fees += 100
        end
      @registered_vehicles << vehicle
      else
        nil
      end
    else 
      nil
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.permit == true && registrant.age > 15
      registrant.license_data[:written] = true
    else 
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
    else 
      false
    end
  end

  def name!(name)
    @name = name
  end
end
