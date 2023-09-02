require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    

  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['Vehicle Registration'])
    end
  end

    describe '#Register Vehicle' do
      before(:each) do 
        @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
        @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
        @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      end
      
        it 'starts with no vehicles' do
        expect(@facility_1.registered_vehicles).to eq([])
      end

      it 'Register a cruz' do  
        @facility_1.add_service('Vehicle Registration')
        expect(@cruz.registration_date).to eq(nil)

        @facility_1.register_vehicle(@cruz)

        expect(@cruz.registration_date).to eq(Date.today)
        expect(@cruz.plate_type).to eq(:regular)
        expect(@facility_1.registered_vehicles).to eq([@cruz])

      end

      it 'Register camaro' do
        @facility_1.add_service('Vehicle Registration')
        @facility_1.register_vehicle(@cruz)
        @facility_1.register_vehicle(@camaro)
        expect(@camaro.registration_date).to eq(Date.today)
        expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
        expect(@camaro.plate_type).to eq(:antique)
        
      end

      it 'Register bolt' do
        @facility_1.add_service('Vehicle Registration')
        @facility_1.register_vehicle(@cruz)
        @facility_1.register_vehicle(@camaro)
        @facility_1.register_vehicle(@bolt)
        expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
        expect(@bolt.registration_date).to eq(Date.today)
        expect(@bolt.plate_type).to eq(:ev)
      end

      it 'collects a fee' do
        @facility_1.add_service('Vehicle Registration')
        expect(@facility_1.collected_fees).to eq(0)
        @facility_1.register_vehicle(@cruz)
        expect(@facility_1.collected_fees).to eq(100)
        @facility_1.register_vehicle(@camaro)
        expect(@facility_1.collected_fees).to eq(125)
        @facility_1.register_vehicle(@bolt)
        expect(@facility_1.collected_fees).to eq(325)
      end

      it 'Check facility_2' do
        @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
        expect(@facility_2.registered_vehicles).to eq([])
        expect(@facility_2.services).to eq([])
        expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
        expect(@facility_2.registered_vehicles).to eq([])
        expect(@facility_2.collected_fees).to eq(0)
      end
    end

    describe '#Getting Drivers license' do
      before(:each) do 
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 16 )
        @registrant_3 = Registrant.new('Tucker', 15 )
        @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
        @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      end

    describe '#Written test' do
      it 'registrant_1 writtent test' do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_1.permit?).to be(true)
        expect(@facility_1.administer_written_test(registrant_1)).to be(false)
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        
        expect(@facility_1.add_service('Written Test')).to eq(["Written Test"])
        expect(@facility_1.administer_written_test(registrant_1)).to be(true)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it 'registrant_2 written test' do
        expect(@registrant_2.age).to eq(16)
        expect(@registrant_2.permit?).to be(false)
        expect(@facility_1.administer_written_test(registrant_2)).to be(false)

        @registrant_2.earn_permit
        expect(@facility_1.administer_written_test(registrant_2)).to be(true)
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it 'registrant_3 written test' do
        expect(@registrant_2.age).to eq(15)
        expect(@registrant_2.permit?).to be(false)
        expect(@facility_1.administer_written_test(registrant_2)).to be(false)

        @registrant_2.earn_permit
        expect(@facility_1.administer_written_test(registrant_2)).to be(false)
        expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      
    end
end

