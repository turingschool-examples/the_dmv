require 'json'

class FacilityFactory
  def create_facilities(data, state)
    if state == :OR
     oregon_processing(data)
    elsif state == :NY
     new_york_processing(data)
    elsif state == :MO
      missouri_processing(data)
    else
      "that state's data is not valid for processing"
    end
  end

  def oregon_processing(data)
    data.map do |facility|
      Facility.new({
       name: OR_format_name(facility),
       address: OR_format_address(facility),
       phone: OR_format_phone_number(facility)
                  })
    end
  end

  def OR_format_name(facility)
    facility[:title]
  end

  def OR_format_address(facility)
    JSON.parse(facility[:location_1][:human_address]).values.join(" ")
  end

  def OR_format_phone_number(facility)
    return nil if !facility[:phone_number]
    facility[:phone_number]
  end

  def new_york_processing(data)
    data.map do |facility|
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
    "#{facility[:street_address_line_1]} #{facility[:city]} #{facility[:state]} #{facility[:zip_code]}"
  end

  def NY_format_phone(facility)
    return nil if facility[:public_phone_number].nil?
    facility[:public_phone_number].insert(3,"-").insert(-5, "-")
  end

  def missouri_processing(data)
    data.map do |facility|
      Facility.new({ 
        name: MO_format_name(facility),
        address: MO_format_address(facility), 
        phone: MO_format_phone(facility)
      })
    end
  end

  def MO_format_name(facility)
    facility[:name].capitalize + " DMV Office"
  end

  def MO_format_address(facility)
    "#{facility[:address1]} #{facility[:city]} #{facility[:state]} #{facility[:zipcode]}"
  end

  def MO_format_phone(facility)
    return nil if !facility[:phone]
    facility[:phone].delete("() ").insert(3, "-")
  end
end