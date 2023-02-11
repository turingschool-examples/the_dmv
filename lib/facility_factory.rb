class FacilityFactory
  def initialize
  end

  def create_facilities(source)
    source.map do |facility|
      Facility.new({name: facility[:title], address: extract_address(facility), 
      phone: facility[:phone_number]})
    end
  end

  def extract_address(facility)
    JSON.parse(facility.dig(:location_1, :human_address)).values.join(' ')
  end
end