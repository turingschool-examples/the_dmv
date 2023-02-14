require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('Albany DMV Office')
      expect(@facility.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility.phone).to eq('541-967-2014')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register vehicle' do
    it 'can register vehicles' do
      expect(@facility.registered_vehicles).to eq([])
      @facility.services << 'Vehicle Registration'
      regular_vehicle = Vehicle.new({year: 2010, engine: :ice})
      ev = Vehicle.new({year: 2015, engine: :ev})
      antique_vehicle = Vehicle.new({year: 1996, engine: :ice})

      [regular_vehicle, ev, antique_vehicle].each{ |vehicle| @facility.register_vehicle(vehicle) }
      expect(@facility.collected_fees).to eq(325)
      expect(regular_vehicle.plate_type).to eq(:regular)
      expect(ev.plate_type).to eq(:ev)
      expect(regular_vehicle.plate_type).to eq(:regular)
      expect(antique_vehicle.plate_type).to eq(:antique)
    end
  end
end
