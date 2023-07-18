require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory
  before do
    @factory = VehicleFactory.new
  end


  #this needs to go somewhere in here
  wa_ev_registrations = DmvDataService.new.wa_ev_registrations
end