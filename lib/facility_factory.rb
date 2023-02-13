require 'json'

class FacilityFactory

  @@valid_states = %i[MO NY OR]

  def initialize
  end

  def create_facilities(facility_data, state)
    return "Sorry, this state is not yet supported." if !@@valid_states.include?(state)

    details_array =
      case state
      when :MO
        mo_standardize_data(facility_data)
      when :NY
        ny_standardize_data(facility_data)
      when :OR
        or_standardize_data(facility_data)
      end

    details_array.map { |facility| Facility.new(facility) }
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
    JSON.parse(data[:location_1][:human_address]).values.join(" ")
  end
end
