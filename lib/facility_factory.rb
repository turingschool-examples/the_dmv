class FacilityFactory
  attr_reader :facilities
  def initialize
    @facilities = []
  end

  def create_facilities(items)
    items.map do |item|
      new_facility = Facility.new({
      name: item[:dmv_office], 
      address: "#{item[:address_li]} #{item[:address__1]} #{item[:city]} #{item[:state]} #{item[:zip]}", 
      phone: item[:phone]})
      new_facility.add_service(item[:services_p])
      new_facility.services = new_facility.services[0].to_s.gsub(',' , "").gsub(';' , "").split
        facilities << new_facility
    end
  end

end