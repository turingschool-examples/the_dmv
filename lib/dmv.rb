class Dmv
  attr_reader :facilities,
              :service
  def initialize
    @facilities = []
    @service = service 
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    select_service = []
    @facilities.each do |facility|
      select_service << facility if facility.services.include?(service) 
    end
    select_service
  end
end
