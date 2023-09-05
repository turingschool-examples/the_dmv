class DmvFacility
  attr_reader :dmv_api_data

  def initialize
    @dmv_office_locations = []
    @dmv_api_data = DmvDataService.new.co_dmv_office_locations
    @dmv_location_data = {
      dmv_office: nil,
      address: nil,
      address_suite: nil,
      city: nil,
      state: nil,
      zip: nil,
      phone: nil,
      hours: nil,
      services: nil
    }
  end

  def create_dmv_facility(dmv_api_data)
    dmv_api_data.each do |data|


end
