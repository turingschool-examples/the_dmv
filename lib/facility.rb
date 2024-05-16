class Facility
  attr_reader :name, 
              :phone, 
              :address, 
              :services
              
  def initialize(facility_info)
    @name = facility_info[:name]
    @phone = facility_info[:phone]
    @address = facility_info[:address]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end


# @facility_2
  # "New Driver's License"
  # "Road Test"
  # "Written Test"

# @facility_3
  # "New Drivers License"
  # "Road Test"