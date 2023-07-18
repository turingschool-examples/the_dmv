require 'facility'
require 'dmv_data_service'

class FacilityFactory

  def create_facilities(api_database)
    facilities =[]

    api_database.each do |location|
      new_facility = Facility.new({
        name: location[:dmv_office],
        address: "#{location[:address_li]}, #{location[:address__1]}, #{location[:city]}, #{location[:state]}, #{location[:zip]} ",
        phone: location[:phone]
      })
      facilities << new_facility
    end
    facilities
  end
end
