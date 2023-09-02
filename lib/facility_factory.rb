class FacilityFactory
  attr_reader :facilities
  def initialize
    @facilities = []
  end

  def create_facilities(facilities)
    facilities.map do |facility|
      new_facility = Facility.new({
      name: facility[:dmv_office], 
      address: "#{facility[:address_li]} #{facility[:address__1]} #{facility[:city]} #{facility[:state]} #{facility[:zip]}", 
      phone: facility[:phone], services: facility[:services_p]})
        facilities << new_facility
    end
  end
  
end