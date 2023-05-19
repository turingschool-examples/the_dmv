class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end


#todo = can track registered vehicles
#todo = can track collected fees - collect when reg vehicle
#todo = set plate type
#todo = fee based on antique?, EV, or regular
#todo = write logic so FAC will not reg a vehicle without that service


