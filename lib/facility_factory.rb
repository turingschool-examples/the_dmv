class FacilityFactory
  def initialize
  end
  
  def create_factory(office_locations)
    office_locations.map do |office_data|
       Facility.new({
        name: office_data[:dmv_office],
        address: office_data[
          street_add: office_data[:address_li], 
          add_line_2: office_data[:address__1], 
          city: office_data[:city],
          state: office_data[:state],
          zip: office_data[:zip]
        ],
        phone: office_data[:phone]
      })
    end
  end
end

