class DmvFactory
  def initialize
  end

  def create_facilities(dmv_facilities_data)
    dmv_facilities = []
    dmv_facilities_data.map do |data|
      new_facility = Facility.new({
        name: data[:dmv_office],
        address: "#{data[:address_li]}, #{data[:address__1]}, #{data[:city]}, #{data[:state]}, #{data[:zip]}",
        phone: data[:phone]
      })
      dmv_facilities << new_facility
    end
    dmv_facilities
  end
end
