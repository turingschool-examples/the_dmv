class Dmv
  attr_reader :name, :address, :phone
  
  def initialize(name, address, phone)
    @name
    @address 
    @phone 
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
