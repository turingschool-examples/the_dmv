class Facility
  attr_accessor :name, :address, :phone, :services, :registration_date, :registered_vehicles

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
  end

  def registration_date
    nil
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
  end

  def collected_fees
    collected_fees = 0
    @registered_vehicles.each do |vehicle|
      if @plate_type == :ev
        collected_fees += 200
      elsif @plate_type == :antique
        collected_fees += 25
      else
        collected_fees += 100
      end
    end
    collected_fees
  end
end