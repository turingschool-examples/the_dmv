class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(*service)
    arr =[]
    service.each do |i|  
    @facilities.each do |facility|
      if facility.services.include?(i)
        arr << facility
      end
     end
    end
    arr
  end
end
