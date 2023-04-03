require 'json'

class FacilityFactory
  def create_facilities(data, state)
    if state == :OR
     oregon_processing(data)
    elsif data == :NY
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
end