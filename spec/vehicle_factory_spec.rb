require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#creates_a_vehicle ' do
    it 'will create vehicle objects with registration' do
      @factory.creates_a_vehicle(@wa_ev_registrations).each do |registration|
      expect(registration).to be_a(Vehicle)
    end
  end
end