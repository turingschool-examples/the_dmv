require 'spec_helper'
require 'rspec'
require './lib/facility'
require './lib/vehicle'
require './lib/registrant'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    @registrant1 = Registrant.new('Bruce', 18, true)
    @registrant2 = Registrant.new('Penny', 16)
    @registrant3 = Registrant.new('Tucker', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])

      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@cruz.registration_date).to eq(nil)
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

  describe '#register vehicles' do
    it 'can register vehicles' do 
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today.year)
      expect(@cruz.plate_type).to eq(:regular)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'can register multiple vehicles and calculate fees' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @bolt, @camaro])
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#register vehicles' do
    it 'can register vehicles' do 
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today.year)
      expect(@cruz.plate_type).to eq(:regular)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@facility_1.collected_fees).to eq(100)
    end
  end

  describe '#administer_written_test' do
    it 'can administer a written test only if: person is 16yo>=, have a permit and the facility offers the service' do
      expect(@facility_1.administer_written_test(@registrant1)).to eq(false)
      expect(@registrant1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @facility_1.add_service("Written Test")
      expect(@facility_1.administer_written_test(@registrant1)).to eq(true)
      expect(@registrant1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'can utilize one facility for multiple people' do 
      @facility_1.add_service("Written Test")
      expect(@facility_1.administer_written_test(@registrant1)).to eq(true)
      expect(@registrant1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

      expect(@facility_1.administer_written_test(@registrant2)).to eq(false)
      @registrant2.earn_permit
      expect(@facility_1.administer_written_test(@registrant2)).to eq(true)
      expect(@registrant2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

      expect(@facility_1.administer_written_test(@registrant3)).to eq(false)
      @registrant3.earn_permit
      expect(@facility_1.administer_written_test(@registrant3)).to eq(false)
      expect(@registrant3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#administer_road_test' do
    it 'can administer a road test only if: person has a permit test, has a written test and the facility offers the service' do
      expect(@facility_1.administer_written_test(@registrant1)).to eq(false)
      expect(@registrant1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @registrant1.earn_permit
      @facility_1.add_service("Written Test")
      expect(@facility_1.administer_written_test(@registrant1)).to eq(true)
      expect(@registrant1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

      @facility_1.add_service("Road Test")
      expect(@facility_1.administer_road_test(@registrant1)).to eq(true)
      expect(@registrant1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end

  describe '#renew_drivers_license' do
    it 'can renew a drivers license only if: person has a written test, have a permit and the facility offers the service' do
      expect(@facility_1.administer_written_test(@registrant1)).to eq(false)
      expect(@registrant1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @registrant1.earn_permit
      @facility_1.add_service("Written Test")
      expect(@facility_1.administer_written_test(@registrant1)).to eq(true)
      expect(@registrant1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

      @facility_1.add_service("Road Test")
      expect(@facility_1.administer_road_test(@registrant1)).to eq(true)
      expect(@registrant1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})

      @facility_1.add_service("Renew License")
      expect(@facility_1.renew_drivers_license(@registrant1)).to eq(true)
      expect(@registrant1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end
  end
end