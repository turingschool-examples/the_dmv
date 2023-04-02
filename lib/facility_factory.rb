require 'json'

class FacilityFactory
  def initialize
    @oregon_created_facilities = []
  end

  def create_facilities(data)
    until data.empty?
      data.map do |facility|
        new_facility = Facility.new(facility)
         new_facility.name = facility[:title]
         new_facility.address = JSON.parse(facility[:location_1][:human_address]).values.join(" ")
         new_facility.phone = facility[:phone_number]
        @oregon_created_facilities << new_facility
        require 'pry'; binding.pry
      end
    end
    @oregon_created_facilities
  end
end