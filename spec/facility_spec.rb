require 'spec_helper'
require './lib/facility'
require './lib/vehicle'
require './lib/registrant'
require 'date'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
    
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('Albany DMV Office')
      expect(@facility_1.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility_1.phone).to eq('541-967-2014')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
      
    end
  end

  describe '#add attributes' do
    it 'add registered_vehicles and collected_fees' do
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#register_vehicle' do
    it 'add method to register vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end
  end

  describe '#collect fees' do
    it 'finds collected fees amount' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.collect_fees
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@facility_1.collected_fees).to eq(100)
    end
  end

  describe '#register more vehicles' do
    it 'registers more vehicles' do
      date = Date.today
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      @cruz.add_registration_date(date)
      @camaro.add_registration_date(date)
      @bolt.add_registration_date(date)
      expect(@camaro.registration_date).to eq(date)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.registration_date).to eq(date)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
    end
  end

  describe '#collect fees' do
    it 'collects fees from all vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      @facility_1.collect_fees
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#facility_2' do
    it 'check facility_2' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.registered_vehicles).to eq([])
    end
  end

  describe '#fees for facility_2' do
    it 'collects the fees for facility_2' do
      @facility_2.collect_fees
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe '#drivers license' do
    it 'assess registrant info' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_1.permit?).to eq(true)
    end
  end

  describe '#written test' do
    it 'administers written test' do
      @facility_1.add_service("Written Test")
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      expect(@facility_1.administer_written_test(registrant_1)).to eq(false)
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#registrant_2' do
    it 'checks registrant_2 attributes' do
      registrant_2 = Registrant.new('Penny', 16 )
      expect(registrant_2.age).to eq(16)
      expect(registrant_2.permit?).to eq(false)
      expect(@facility_1.administer_written_test(registrant_2)).to eq(false)
      registrant_2.earn_permit
      expect(@facility_1.administer_written_test(registrant_2)).to eq(true)
    end
  end

  describe 'registrant_3' do
    it 'checks registrant_3 attributes'do
      registrant_3 = Registrant.new('Tucker', 15 )
      expect(registrant_3.age).to eq(15)
      expect(registrant_3.permit?).to eq(false)
      expect(@facility_1.administer_written_test(registrant_3)).to eq(false)
      registrant_3.earn_permit
      expect(@facility_1.administer_written_test(registrant_3)).to eq(false)
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#road test' do
    it 'administers road tests' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      expect(@facility_1.administer_road_test(registrant_3)).to eq(false)
      registrant_3.earn_permit
      expect(@facility_1.administer_road_test(registrant_3)).to eq(false)
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#road test 2' do
    it 'administers road test for registrant_1' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_1.earn_permit
      expect(@facility_1.administer_road_test(registrant_1)).to eq(false)
      @facility_1.add_service('Road Test')
      expect(@facility_1.administer_road_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end

  describe '#road test 3' do
    it 'administers road test to registrant_3' do
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_2.earn_permit
      @facility_1.add_service('Road Test')
      expect(@facility_1.administer_road_test(registrant_2)).to eq(true)
      expect(registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})

    end
  end

  describe '#renew license' do
    it 'adds renew license service' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')
      expect(@facility_1.services).to eq(["Written Test", "Road Test", "Renew License"])
      expect(@facility_1.renew_drivers_license(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end
  end

  describe '#renew license for other registrants' do
    it 'renew registrant_2 and registrant_3 license' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')
      expect(@facility_1.renew_drivers_license(registrant_3)).to eq(false)

    end
  end
end
# registrant_1.earn_permit
# @facility_1.administer_written_test(registrant_1)
# @facility_1.administer_road_test(registrant_1)