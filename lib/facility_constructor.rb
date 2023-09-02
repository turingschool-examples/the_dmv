class FacilityConstructor

  def create_facilities(api_hash_array)
    new_facilities = []
    api_hash_array.each do |facility_data|
      facility = Facility.new(parse(facility_data))
      new_facilities << facility
    end
    new_facilities
  end

  def parse(api_hash)
    api_hash[:name] = api_hash[:dmv_office]
    api_hash[:address] = "#{api_hash[:address_li]} #{api_hash[:address__1]} #{api_hash[:city]} #{api_hash[:state]} #{api_hash[:zip]}"
    api_hash
  end
end