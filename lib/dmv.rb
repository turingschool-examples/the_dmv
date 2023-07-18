class Dmv

  def initialize(name, address, phone)
    @facilities = []
    @name = name
    @address = address
    @phone = phone
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
