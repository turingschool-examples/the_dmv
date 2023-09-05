require './spec/spec_helper'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'exists' do
      expect(VehicleFactory.new).to be_a VehicleFactory
    end
  end

  it 'can batch instantiate Vehicle instances using external data' do
    wa_dds = DmvDataService.new.wa_ev_registrations
    wa_ev_vehicles = VehicleFactory.new.create_vehicles(DmvDataService.new.wa_ev_registrations)
    expect(wa_ev_vehicles.count).to eq(1000)
    expect(wa_ev_vehicles[0].vin).to eq(wa_dds[0][:vin_1_10])
    expect(wa_ev_vehicles[0].vin).to eq('1N4AZ0CPXF')
    expect(wa_ev_vehicles[0].year).to eq(wa_dds[0][:model_year])
    expect(wa_ev_vehicles[0].year).to eq('2015')
    expect(wa_ev_vehicles[0].make).to eq(wa_dds[0][:make])
    expect(wa_ev_vehicles[0].make).to eq('NISSAN')
    expect(wa_ev_vehicles[0].model).to eq(wa_dds[0][:model])
    expect(wa_ev_vehicles[0].model).to eq('Leaf')
    expect(wa_ev_vehicles.sample.engine).to eq(:ev)
    expect(wa_ev_vehicles.sample.plate_type).to eq(:ev)
  end
end