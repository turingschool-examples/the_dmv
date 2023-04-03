require 'json'

class FacilityFactory
   def create_facilities(data)
    data.map do |facility|
      Facility.new({
      require 'pry'; binding.pry
       name: facility[:title],
       address: JSON.parse(facility[:location_1][:human_address]).values.join(" "),
       phone: facility[:phone_number]
                  })
    end
  end
end