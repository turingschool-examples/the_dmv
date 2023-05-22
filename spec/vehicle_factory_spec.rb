require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'can initialize' do
    factory = VehicleFactory.new
    expect(factory).to be_an_instance_of(VehicleFactory)

    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    expect(wa_ev_registrations).to be_a Array
    expect(wa_ev_registrations[0]).to be_a Hash
      end
    end
    # describe '#create vehicles from data in link' do
    #   it 'can create vehicles' do
    #     expect(factory.create_vehicles(wa_ev_registrations)).to be_a Array
  #   end
  # end 
end