class FacilityFactory
  attr_reader :new_facilities

  def initialize
    @new_facilities = []
  end

  def create_facilities(facilities)
    
    facilities.each do |facility|
      @new_facilities << Facility.new({
        name: facility[:title],
        address: facility[:human_address],
        phone: facility[:phone_number]
      })
    end
  end


end