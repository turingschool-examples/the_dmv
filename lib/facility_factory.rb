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
       name: facility[:title],
       address: JSON.parse(facility[:location_1][:human_address]).values.join(" "),
       phone: OR_format_phone_number(facility)
                  })
    end
  end

  def OR_format_phone_number(facility)
    return nil if !facility[:phone_number]
    facility[:phone_number]
  end

  def new_york_processing(data)
    data.map do |facility|
      Facility.new({ 
        name: facility[:office_name].capitalize + " DMV Office",
        address: "#{facility[:street_address_line_1]} #{facility[:city]} #{facility[:state]} #{facility[:zip_code]}",
        phone: NY_format_phone(facility)
      })
    end
  end

  def NY_format_phone(facility)
    return "nil" if facility[:public_phone_number].nil?
    facility[:public_phone_number].insert(3,"-").insert(-5, "-")
  end

  def missouri_processing(data)
    data.map do |facility|
      Facility.new({ 
        name: facility[:name].capitalize + " DMV Office",
        address: "#{facility[:address1]} #{facility[:city]} #{facility[:state]} #{facility[:zipcode]}", 
        phone: MO_format_phone(facility)
      })
    end
  end

  def MO_format_phone(facility)
    return nil if !facility[:phone]
    facility[:phone].delete("() ").insert(3, "-")
  end
end