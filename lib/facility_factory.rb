class FacilityFactory

  @@valid_states = [:MO, :NY, :OR]

  def initialize
  end

  def create_facilities(facility_data, state)
    return "Sorry, this state is not yet supported." if !@@valid_states.include?(state)

    case state
    when :MO
      facility_details_array = mo_standardize_data(facility_data)
    when :NY
      facility_details_array = ny_standardize_data(facility_data)
    when :OR
      facility_details_array = or_standardize_data(facility_data)
    end

    facility_details_array.map { |facility_details| Facility.new(facility_details) }
  end

  def mo_standardize_data(data)
    data.map do |facility|
      {name: mo_format_name(facility),
       phone: mo_format_phone(facility),
       address: mo_format_address(facility)}
    end
  end

  def ny_standardize_data(data)
    data.map do |facility|
      {name: ny_format_name(facility),
       phone: ny_format_phone(facility),
       address: ny_format_address(facility)}
    end
  end

  def or_standardize_data(data)
    data.map do |facility|
      {name: facility[:title],
       phone: facility[:phone_number],
       address: or_format_address(facility)}
    end
  end

  def mo_format_name(data)
    "#{data[:name].strip} DMV Office"
  end

  def mo_format_address(data)
    "#{data[:address1]} #{data[:city]} #{data[:state]} #{data[:zipcode]}"
  end

  def mo_format_phone(data)
    return "No phone." if data[:phone].nil?
    data[:phone].delete('() ').insert(3, '-')
  end

  def ny_format_name(data)
    "#{data[:office_name].strip} DMV Office"
  end

  def ny_format_address(data)
    "#{data[:street_address_line_1]} #{data[:city]} #{data[:state]} #{data[:zip_code]}"
  end

  def ny_format_phone(data)
    return "No phone." if data[:public_phone_number].nil?
    data[:public_phone_number].insert(3, '-').insert(7, '-')
  end

  def or_format_address(data)
    data[:location_1][:human_address].delete('{}\"').split(', ').map { |address| address.split(': ')[1] }.join(" ")
  end
end
