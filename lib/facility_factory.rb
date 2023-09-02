class FacilityFactory
  attr_reader :facilities
  def initialize
    @facilities = []
  end

  def create_facilities(facilities)
    facilities.map do |facility|
      new_facility = Facility.new({
      name: facility[:dmv_office], 
      address: facility[:address_li :address__1 :city :state :zip ], 
      phone: facility[:phone], services: facility[:services_p]})
        facilities << new_facility
    end
  end
end