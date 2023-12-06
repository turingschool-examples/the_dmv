require './lib/vehicle'

class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees

  def initialize(input)
    @name = input[:name]
    @address = input[:address]
    @phone = input[:phone]
    @services = []
    @collected_fees = 0
    @plate_type = {}
  end

  def add_service(service)
    @services << service
  end

  def collect_fees(vehicle)
    if vehicle.plate_type == :ev
      @collected_fees  += 200
    elsif vehicle.plate_type == :antique
      @collected_fees += 25
    else
      @collected_fees += 100
    end
  end
end
