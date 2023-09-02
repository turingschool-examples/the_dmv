class FacilityConstructor

  def create_facilities(api_hash_array)
    new_facilities = []
    api_hash_array.each do |facility_data|
      facility = Facility.new(parse(facility_data))
      new_facilities << facility
    end
    new_facilities
  end

  def parse(facility_data)
    facility_data
  end
end