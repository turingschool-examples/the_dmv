class FacilityFactory
  attr_accessor :facility_instances

  def initialize
    @facility_instances = []
  end

  def create_facilities(facilities_data)
    @facility_instances = facilities_data.map do |facility|
      Facility.new(
        name: facility[:dmv_office],
        address: facility[:address_li],
        phone: facility[:phone]
      )
    end
  end

  
end