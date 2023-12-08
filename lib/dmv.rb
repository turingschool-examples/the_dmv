class Dmv

  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end
  
  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end
end


# Error: find method only returns first value that fulfills the condition. The find_all method returns each facility object that fulfills the condition.