class DmvFactory
  def initialize
  end

  def self.create_facilities(dmv_facilities_data)
    dmv_facilities = []
    dmv_facilities_data.map do |data|
      new_facility = Facility.new({
        dmv_id: data[:dmv_id],
        dmv_office: data[:dmv_office],
        address: "#{data[:address_li]}, #{data[:address__1]}",
        city: data[:city],
        state: data[:state],
        zip: data[:zip],
        phone: data[:phone],
        hours: data[:hours],
        services: data[:services_p],
        parking: data[:parking_no],
        photo: data[:photo]
      })
      dmv_facilities << new_facility
    end
    dmv_facilities
  end
end
