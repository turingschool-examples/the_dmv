class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []

    # Below copy and paste helped with syntax comparison
    # @vin = vehicle_details[:vin]
    # @year = vehicle_details[:year]
    # @make = vehicle_details[:make]
    # @model = vehicle_details[:model]
    # @engine = vehicle_details[:engine]
  end

  def add_service(service)
    @services << service
  end
end
