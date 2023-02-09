class Facility
  attr_reader :name, :address, :phone, :services
  attr_accessor :registered_vehicles, :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
    if services.include?('Vehicle Registration')
      self.registered_vehicles << car
    end
  end
end
