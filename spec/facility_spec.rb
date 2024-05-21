require 'pry'
require 'spec_helper'
require './lib/vehicle'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_a Facility
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
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

  describe '#register_vehicle' do
    it 'can register vehicles' do

      # binding.pry

      expect (@facility_1.register_vehicle(@cruz)).should == nil
      @facility_1.add_service( 'Vehicle Registration' )
      expect (@facility_1.registered_vehicles).should == []
      expect (@cruz.plate_type).should == nil
      expect (@cruz.registration_date).should == nil
      expect (@facility_1.collected_fees).should == 0
      expect (@facility_1.register_vehicle(@cruz)).should == [@cruz]
      # expect (@cruz.plate_type).should == :regular
      expect (@cruz.registration_date).should == Date.today
      expect (@facility_1.collected_fees).should == 100
      # expect(@facility_1.registered_vehicles).should == [@cruz]
    end
  end

  describe '#renew_drivers_license' do
    it 'describes if a license can be renewed' do
      @registrant_1.license_data[:written] = true
      @registrant_1.license_data[:license] = true
      expect(@facility.renew_drivers_license(@registrant_1)).to eq(false)
      @registrant_1.license_data[:renewed] = false
      expect(@facility.renew_drivers_license(@registrant_1)).to eq(true)
      expect(@facility.renew_drivers_license(@registrant_3)).to eq(false)
      expect(@facility.renew_drivers_license(@registrant_2)).to eq(false)
    end
  end
end
