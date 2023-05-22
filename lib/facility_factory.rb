class Facility_factory

  def create_facility(facilities_data)
    facilities = []
    facilities_data.map do |facility_data|
      if facility_data.has_key?(:office_name)
        data = ny_parser(facility_data)
        # require 'pry'; binding.pry
      elsif facility_data.has_key?(:address1)
        data = mo_parser(facility_data)
      elsif facility_data.has_key?(:location_1)
        data = or_parser(facility_data)
      else
        nil
      end
      facility = Facility.new(data)
      facilities << facility
      # require 'pry'; binding.pry
    end
    facilities
  end

  def ny_parser(facility_data)
    name = facility_data[:office_name]
    address = [facility_data[:street_address_line_1], facility_data[:city], facility_data[:state], facility_data[:zip_code]].join(" ")
    phone = facility_data[:public_phone_number]
    # require 'pry'; binding.pry
    {name: name, address: address, phone: phone}
  end

  def mo_parser(facility_data)
    name = facility_data[:name]
    address = [facility_data[:address1], facility_data[:city], facility_data[:state], facility_data[:zipcode]].join(" ")
    phone = facility_data[:phone]

    {name: name, address: address, phone: phone}
  end

  def or_parser(facility_data)
    name = facility_data[:title]
    address = JSON.parse(facility_data[:location_1][:human_address]).values.join(" ")
    phone = facility_data[:phone_number]

    {name: name, address: address, phone: phone}
  end
end

