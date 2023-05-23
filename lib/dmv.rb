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

  def oregon_parse(oregon)
    oregon.map do |office|
      name = office[:title]
      address_to_parse = JSON.parse(office[:location_1][:human_address])
      address = address_to_parse.values.join(" ")
      phone = office[:phone_number]

      {name: name, address: address, phone: phone}
    end   
  end

  def new_york_parse(new_york)
    new_york.map do |office|
      name = office[:office_name]
      address = office[:street_address_line_1]
      phone = office[:public_phone_number]

      {name: name, address: address, phone: phone}
    end
  end

  def missouri_parse(missouri)
    missouri.flat_map do |office|
      name = office[:name]
      address = office[:address1]
      phone = office[:phone]

      {name: name, address: address, phone: phone}
    end
  end

  def parse_states_data(dmv_office)
    if dmv_office.first.has_key?(:title)
      locations = oregon_parse(dmv_office)
    elsif dmv_office.first.has_key?(:office_name)
      locations = new_york_parse(dmv_office)
    elsif dmv_office.first.has_key?(:name)
      locations = missouri_parse(dmv_office)
    else
      nil
    end
  end

  def create_facilities(dmv_office)
    locations = parse_states_data(dmv_office)
    locations.map do |location|
      facility = Facility.new(location)
      @facilities << facility
    end
  end
end
