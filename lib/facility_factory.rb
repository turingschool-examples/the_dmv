class FacilityFactory
  def create_facility(api_data)
    facilities = []
    api_data.each do |data|
      name = data[:dmv_office]
      address = "#{:address_li} #{:address__1} #{:city} #{:state} #{:zip}"
      phone = data[:phone]
     
      facility = Facility.new(name:, address:, phone:)
      facilities << facility
    end 
    facilities
  end 
end              