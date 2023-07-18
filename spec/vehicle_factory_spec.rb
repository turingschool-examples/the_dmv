require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  # describe '#initialize' do
  #   it 'can initialize' do
  #     expect(@cruz).to be_an_instance_of(Vehicle)
  #     expect(@cruz.vin).to eq('123456789abcdefgh')
  #     expect(@cruz.year).to eq(2012)
  #     expect(@cruz.make).to eq('Chevrolet')
  #     expect(@cruz.model).to eq('Cruz')
  #     expect(@cruz.engine).to eq(:ice)
  #     expect(@cruz.registration_date).to eq(nil)
  #   end
  # end

end