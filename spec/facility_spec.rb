require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
  end

  describe '#initialize' do 
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe "instances of Facility" do 
     it "creates new facilities" do 
      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@facility_2.name).to eq('DMV Northeast Branch')
      expect(@facility_2.address).to eq('4685 Peoria Street Suite 101 Denver CO 80239')
      expect(@facility_2.phone).to eq('(720) 865-4600')
      expect(@facility_2.services).to eq([])
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
  
end

describe 'registration' do 
  it 'registers vehicles' do 
    @facility_1.add_service('Vehicle Registration')
    expect(@cruz.registration_date).to be nil
    expect(@facility_1.registered_vehicles).to eq([])
    expect(@facility_1.collected_fees).to eq(0)
    #cruz
    @facility_1.register_vehicle(@cruz)
    expect(@cruz.registration_date).to be_a Date
    expect(@cruz.plate_type).to eq(:regular)
    expect(@facility_1.registered_vehicles).to eq([@cruz])
    expect(@facility_1.collected_fees).to eq(100)
    #camaro
    @facility_1.register_vehicle(@camaro)
    expect(@camaro.registration_date).to be_a Date
    expect(@camaro.plate_type).to eq(:antique)
    #bolt
    @facility_1.register_vehicle(@bolt)
    expect(@bolt.registration_date).to be_a Date
    expect(@bolt.plate_type).to eq(:ev)
    expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
    expect(@facility_1.collected_fees).to eq(325)
  end

  xit 'no register if no can register' do 
    expect(@facility_2.registered_vehicles).to eq([])
    expect(@facility_2.services).to eq([])
    expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
    expect(@facility_2.registered_vehicles).to eq([])
    expect(@facility_2.collected_fees).to eq(0)
  end
end

describe '#administer_written_test' do 
  xit 'written test only if facility_1 able' do 
    expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    expect(@registrant_1.permit?).to be true
    expect(@facility_1.administer_written_test(@registrant_1)).to be false
    expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    @facility_1.add_service('Written Test')
    expect(@facility_1.administer_written_test(@registrant_1)).to be true
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
  end

  xit 'written test only for permit holders' do
    @facility_1.add_service('Written Test')
    expect(@registrant_2.age).to eq(16)
    expect(@registrant_2.permit?).to be false
    expect(@facility_1.administer_written_test(@registrant_2)).to be false
    @registrant_2.earn_permit
    expect(@facility_1.administer_written_test(@registrant_2)).to be true
    expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
  end
  
  xit 'no written tests for the very young' do 
    @facility_1.add_service('Written Test')
    expect(@registrant_3.age).to eq(15)
    expect(@registrant_3.permit?).to be false
    expect(@facility_1.administer_written_test(@registrant_3)).to be false
    @registrant_3.earn_permit
    expect(@facility_1.administer_written_test(@registrant_3)).to be false
    expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end
end
