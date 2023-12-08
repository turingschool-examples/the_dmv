class Facility
  attr_reader :services, :name, :address, :phone

  facility_info = {:name => "name",
                  :address => "address",
                  :phone => "phone"
}
  
  
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
