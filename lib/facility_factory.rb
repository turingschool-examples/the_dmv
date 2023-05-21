class FacilityFactory
  attr_reader :operating_facilities

  def initialize
    @operating_facilities = []
  end

  def define_facilities(facilities)
    facilities.each do |facility_data|
      address_data = JSON.parse(facility_data[:location_1][:human_address], symbolize_names: true)
      address = "#{address_data[:address]} #{address_data[:city]} #{address_data[:state]} #{address_data[:zip]}"
      facility = Facility.new({
        name: facility_data[:title],
        address: address,
        phone: facility_data[:phone_number]
        })
        @operating_facilities << facility
    end
    @operating_facilities
  end
end