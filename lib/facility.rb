class Facility
  attr_reader :name, :address, :phone, :services, :facility_info

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
  end
# binding.pry
  def add_service(service)
    @services << service
  end
end


# First error: Test shows that facility only has 1 argument passing which was a hash. The OG file had 3 arguments (name,address,phone). We need to put all of those arguments in one hash to create 1 argument.

# Second error: Mispelling of 'service' in 'add-service' method