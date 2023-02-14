require 'date'

class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility = {})
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  # def add_date
  #   @add_date  = add_date
  #   @registration_date == Date.today
  # end
  
  def collect_fees(car)
    if car.plate_type == :regular
      @collected_fees += 100
    elsif car.plate_type == :ev
      @collected_fees += 200
    elsif car.plate_type == :antique
      @collected_fees += 25
    end
  end

  def register_vehicle(car)
    if @services.include?('Vehicle Registration')
      car.registration_date = Date.today
      car.plate_type
      collect_fees(car)
      @registered_vehicles.push(car)
    end
  end

  def administer_written_test(registrant)
    unless @services.include?('Written Test')
    # end
    registrant.permit = true && registrant.age >= 16
    # @license_data.update(@license_data){ |:written, false| true }
    registrant.license_data[:written] = false
    end
  end

end
