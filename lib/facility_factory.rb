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

    end
  end

  def ny_dmv(data) 
    data.map do |facility|

    end

  end

  def mo_dmv(data)
    data.map do |facility|

    end
  end
end