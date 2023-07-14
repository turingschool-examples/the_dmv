class Dmv
  attr_reader :facilities

  def initialize(name, address, phone)
    @name = name
    @address = address
    @phone = phone
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    @facilities.find do |facility|
      facility.services.include?(service)
    end
  end
end
