require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
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
  
  describe '#vehicle registration' do
    it 'facility_1 exists' do 
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      expect(facility_1).to be_an_instance_of(Facility)
    end

    it 'facility_2 exists' do 
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      facility_2.register_vehicle(bolt)
      expect(facility_2).to be_an_instance_of(Facility)
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.services).to eq([])
      expect(facility_2.collected_fees).to eq(0)
    end
    
    it "has a vehicle" do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      expect(cruz).to be_an_instance_of(Vehicle)
      expect(bolt).to be_an_instance_of(Vehicle)
      expect(camaro).to be_an_instance_of(Vehicle)
    end
  end
  
  describe 'register vehicles' do
    it 'can add services' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Vehicle Registration')
      expect(facility_1.services).to eq (['Vehicle Registration'])
    end

  
    it 'has no registration date' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      expect(cruz.registration_date).to eq(nil)
    end

    it 'can register a vehicle' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Vehicle Registration')
      expect(facility_1.registered_vehicles).to eq([])
    end

    it 'can collect fees' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      expect(facility_1.collected_fees).to eq(0)
    end
  end

  describe '#register_vehicle' do
    it 'has a registration date' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Vehicle Registration')
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      facility_1.register_vehicle(cruz)

      expect(cruz.registration_date).to eq(Date.today) 
    end

    it 'has a plate' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Vehicle Registration')
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      facility_1.register_vehicle(cruz)

      expect(cruz.plate_type).to eq(:regular)
    end

    it 'register the camaro' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})      
      facility_1.add_service('Vehicle Registration')
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      facility_1.register_vehicle(camaro)
      expect(camaro.registration_date).to eq(Date.today)
      expect(camaro.plate_type).to eq(:antique)
    end

    it 'register the bolt' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Vehicle Registration')
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      facility_1.register_vehicle(bolt)
      expect(bolt.registration_date).to eq(Date.today)
      expect(bolt.plate_type).to eq(:ev)
    end

    it 'pays a fee' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Vehicle Registration')
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      facility_1.register_vehicle(cruz)
      # cruz.pay_fee

      expect(facility_1.collected_fees).to eq(100)
    end

    xit 'register them all' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Vehicle Registration')
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      facility_1.register_vehicle(cruz)
      facility_1.register_vehicle(camaro)
      facility_1.register_vehicle(bolt)

      expect(facility_1.collected_fees).to eq(325)    
    end
  end
  describe '#administer written test' do
    it 'can not administer a test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.administer_written_test(registrant_1)

      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
    it 'can administer a test' do

      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Written Test')

      expect(facility_1.services).to eq(["Written Test"])
    end
    it 'can administer a test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)
      
      expect(facility_1.administer_written_test(registrant_1)).to be(true)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false}) 
    end
    it 'registrant 2 can earn a permit and take a test' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Written Test')
      registrant_2 = Registrant.new('Penny', 16 )
      expect(registrant_2.age).to eq(16)
      expect(registrant_2.permit).to eq(false)
      facility_1.administer_written_test(registrant_2)
      expect(facility_1.administer_written_test(registrant_2)).to eq(false)
      registrant_2.earn_permit
      facility_1.administer_written_test(registrant_2)
      expect(facility_1.administer_written_test(registrant_2)).to eq(true)
      expect(registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false}) 
    end
    it 'registrant 3 can not take a test' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Written Test')
      registrant_3 = Registrant.new('Tucker', 15 )
      expect(registrant_3.age).to eq(15)
      expect(registrant_3.permit).to eq(false)
      facility_1.administer_written_test(registrant_3)
      expect(facility_1.administer_written_test(registrant_3)).to eq(false)
      registrant_3.earn_permit
      expect(facility_1.administer_written_test(registrant_3)).to eq(false)
    end
  end
  describe '#add road tests' do
    it 'can administer road test' do
    end
  end
end

