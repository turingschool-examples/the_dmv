class FacilityFactory
attr_reader :facilities
  def initialize()
    @facilities = []
  end

  def create_facilities(source)
    @facilities << source
    @facilities.flatten!(2)

    @facilities.each do |facility|
      facility[:name] = facility.delete :title
      facility[:address] = facility.delete :location_1
      facility[:phone] = facility.delete :phone_number      
    end

    @facilities.each do |facility|
      facility[:address] = facility[:address][:human_address]
    end

    @facilities.map! do |facility|
      Facility.new(facility)
    end
  end
end