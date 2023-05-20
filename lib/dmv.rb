class Dmv
  attr_reader :facilities

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

  def create_facilities(dmv_office)
    dmv_office.select do |office|
      name = office[:title]
      address_to_parse = JSON.parse(office[:location_1][:human_address])
      address = address_to_parse.values.join(" ")
      phone = office[:phone_number]

      new_facility = Facility.new(name: name, address: address, phone: phone)
      @facilities << new_facility
    end
    @facilities
  end
end
