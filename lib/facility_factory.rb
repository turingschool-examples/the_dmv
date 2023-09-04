class FacilityFactory

  def initialize  
  end

  def create_facility(api_data)
    facilities = api_data.map do |data|
    Facility.new(
    name: data[:dmv_office], 
    address: "#{data[:address_li]} #{data[:address__l]}
              #{data[:city]} #{data[:state]} #{data[:zip]}",
    phone: data[:phone] 
    )
    end
  end
end

