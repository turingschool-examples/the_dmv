class Dmv
  attr_reader :facilities, :list_of_offices

  def initialize
    @facilities = []
  end
  
  def add_facility(facility)
    @facilities << facility
  end
  
  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end
  
  def create_facility_helper(offices)
    @list_of_offices = offices.map do |office|
      address_data = office[:address_li], office[:address__1], office[:city], office[:state], office[:zip]
      full_address = address_data.join(" ")
      facility_details = { name: office[:dmv_office], address: full_address, phone: office[:phone]}
    end
  end

  def create_facility
    offices = @list_of_offices.map do |office|
      facility = Facility.new(office)
    end
  end
end
