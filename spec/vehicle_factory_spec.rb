require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do 
  before(:each) do 
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do 
    it 'can initialize' do 
      expect(@factory).to be_a(VehicleFactory)
    end
  end
end