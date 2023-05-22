class FacilityFactory
  def create_facilities(facilites)
    facilites.map do |facility|
      address_hash = JSON.parse(facility[:location_1][:human_address])
      formatted_address = address_hash["address"] + ", " + address_hash["city"] + ", " + address_hash["state"] + ", " + address_hash["zip"]
      facility_details = {}
      facility_details[:name] = facility[:title]
      facility_details[:phone] = facility[:phone_number]
      facility_details[:address] = formatted_address
      Facility.new(facility_details)
    end
  end
end