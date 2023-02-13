class FacilityFactory

  @@valid_states = [:OR, :NY]

  def initialize
  end

  def create_facilities(facility_data, state)
    return "Sorry, this state is not yet supported." if !@@valid_states.include?(state)

    if state == :OR
      facility_details_array =
      facility_data.map do |facility|
          facility_details = {
            name: facility[:title],
            phone: facility[:phone_number],
            address: or_format_address(facility)
          }
        end
    elsif state == :NY
      facility_details_array =
      facility_data.map do |facility|
        facility_details = {
          name: ny_format_name(facility),
          phone: ny_format_phone(facility[:public_phone_number]),
          address: ny_format_address(facility)
        }
      end
    end

    facility_details_array.map { |facility_details| Facility.new(facility_details) }
  end

  def or_format_address(data)
    data[:location_1][:human_address].delete('{}\"').split(', ').map { |address| address.split(': ')[1] }.join(" ")
  end

  def ny_format_name(data)
    "#{data[:office_name].strip} DMV Office"
  end

  def ny_format_address(data)
    "#{data[:street_address_line_1]} #{data[:city]} #{data[:state]} #{data[:zip_code]}"
  end

  def ny_format_phone(data)
    return "No phone." if data.nil?
    data.insert(3, '-').insert(7, '-')
  end
end
