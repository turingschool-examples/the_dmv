class Facility
  attr_accessor :name,
                :address,
                :phone,
                :services 

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []

  end

  def add_service(service)
    @services << service
  end
end
