class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_details)
    @address = facility_details[:address]
    @collected_fees = 0
    @name = facility_details[:name]
    @phone = facility_details[:phone]
    @registered_vehicles = []
    @services = [] 
    
  end

  def add_service(service)
    @services << service
  end
