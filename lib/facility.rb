class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees

  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(model)
    if vehicle.antique?
      collected_fees += 25
    elsif vehicle.electric_vehicle? += 200
    else
      collected_fees += 100
    end
  end
end
