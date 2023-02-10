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
        address: find_address(facility),
        phone: facility[:phone_number]
      }
      facility_sorted = Facility.new(facility_details)
      self.facilities << facility_sorted
    end
    @facilities
  end

  def find_address(data)
    address_h = eval(data[:location_1][:human_address])
    address_s = address_h.values.join(' ')
  end
end
