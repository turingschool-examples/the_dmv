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

  def register_vehicle(car)
    @registered_vehicles.push(car) 
    # if @services.include?(['Vehicle Registration'])
    # end
  end

  def collect_fees
    if @plate_type == :regular
      @collected_fees += 100
    elsif @plate_type == :ev
      @collected_fees += 200
    elsif @plate_type == :antique
      @collected_fees += 25
    end
    # collect_fees
  end

end
