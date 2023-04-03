require 'json'

class FacilityFactory
  def create_facilities(data, state)
    if state == :OR
     oregon_processing(data)
    elsif state == :NY
     new_york_processing(data)
    end
  end

  def oregon_processing(data)
    data.map do |facility|
      Facility.new({
       name: facility[:title],
       address: JSON.parse(facility[:location_1][:human_address]).values.join(" "),
       phone: facility[:phone_number]
                  })
    end
  end

  def new_york_processing(data)
    data.map do |facility|
      require 'pry'; binding.pry
      Facility.new({ 
        name: NY_format_name(facility),
        address: NY_format_address(facility), 
        phone: NY_format_phone(facility)
      })
    end
  end
  
  def NY_format_name(facility)
    facility[:office_name].capitalize + " DMV Office"
  end
  
  def NY_format_address(facility)
    "#{facility[:street_address_line_1]} #{facility[:city].capitalize} #{facility[:state]} #{facility[:zip_code]}"
  end

  def NY_format_phone(facility)
    if facility[:public_phone_number].nil?
      return "no phone number available" 
    else
      facility[:public_phone_number].insert(3,"-").insert(-5, "-")
    end
  end
end