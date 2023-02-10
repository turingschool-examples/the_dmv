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

  def create_facilites(data)
    data.each do |facility|
      facility_details = {
        name: facility[:title],
        address: facility.find_address
        phone: facility[:phone_number]
      }
      facility_sorted = Facility.new(facility_details)
      self.facilities << facility_sorted
    end
    @facilities
  end
end
