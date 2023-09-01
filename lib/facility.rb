require './lib/vehicle'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(contact_info)
    @name = contact_info[:name]
    @address = contact_info[:address]
    @phone = contact_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(make)
    @registration_date
  end
end
