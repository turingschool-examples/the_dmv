class FacilityFactory
  def create_facility(api_data)
    facilities = []
    api_data.each do |data|
      name = data[:dmv_office]
      address = "#{:address_li} #{:address__1} #{:city} #{:state} #{:zip}"
      phone = data[:phone]
      hours = data[:hours]
      model_year = data[:model_year]

      facility = FacilityVehicle.new(name : engine, make: make, model: model, vin: vin, model_year: model_year)
      facilities << facility
    end 
    vehicles
  end 
end              