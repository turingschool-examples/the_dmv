class DmvFacility
  def initialize
  end
end

def create_dmv_facility
  end
end

dmv_facilities_data = DmvDataService.new.co_dmv_office_locations

dmv_facilities = dmv_facilities_data.map do |data|
  DmvFacility.new(data)
end
