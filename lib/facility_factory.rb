class FacilityFactory

  def initialize
  end

  def create_facilities(registration_location)
    registration_location.map do |registration|
      Facility.new(registration_location)
    end
  end

  def or_dmv(data)
    data.map do |facility|
      #figure out how does it differ from other state registrations
      data[:name]
      data[:address]  
      data[:phone]
    end
  end

  def ny_dmv(data) 
    data.map do |facility|
      data[:name]
      data[:address]
      data[:phone]
    end

  end

  def mo_dmv(data)
    data.map do |facility|
      data[:name]
      data[:address]
      data[:phone]
    end
  end
end