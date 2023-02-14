require 'spec_helper'
require './lib/facility'
require './lib/vehicle'

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
  
  describe '#offer services' do
    it 'exists with more services' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    
      expect(facility_1).to be_a(Facility)
      expect(facility_2).to be_a(Facility)
    end

    it 'can register a vehicle' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      
      expect(cruz).to be_a(Vehicle)
      expect(bolt).to be_a(Vehicle)
      expect(camaro).to be_a(Vehicle)
    end
    
    it 'adds a new service "vehicle registration"' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      
      expect(facility_1.add_service('Vehicle Registration')).to eq(["Vehicle Registration"])
      expect(facility_1.services).to eq(['Vehicle Registration'])
    end
    
    it 'can collect fees' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      
      expect(facility_1.collected_fees).to eq(0)
      expect(facility_2.collected_fees).to eq(0)
    end

    it "facility 2 cannot register vehicles" do
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )

      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.services).to eq([])
      expect(facility_2.register_vehicle(bolt)).to eq(nil)
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.collected_fees).to eq(0)
    end
  end
  
  describe "#register a vehicle" do
    it "shows unregistered vehicle details" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      
      expect(facility_1.registered_vehicles).to eq([])
      expect(cruz.registration_date).to eq(nil)
      expect(facility_1.collected_fees).to eq(0)
    end
  end
  describe "#register a vehicle at facillity 1" do
    it "shows registering a cruz at facility_1" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      facility_1.add_service('Vehicle Registration')

      expect(facility_1.register_vehicle(cruz)).to eq([cruz])
      expect(facility_1.registered_vehicles).to eq([cruz])
      expect(cruz.registration_date).to eq(Date.today)
      expect(cruz.plate_type).to eq(:regular)
      expect(facility_1.collected_fees).to eq(100)
    end
  
    it "shows registering a bolt at facility_1" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      facility_1.add_service('Vehicle Registration')

      expect(facility_1.register_vehicle(bolt)).to eq([bolt])
      expect(facility_1.registered_vehicles).to eq([bolt])
      expect(bolt.plate_type).to eq(:ev)
      expect(facility_1.collected_fees).to eq(200)
    end
  
    it "shows registering a camaro at facility_1" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      facility_1.add_service('Vehicle Registration')

      expect(facility_1.register_vehicle(camaro)).to eq([camaro])
      expect(facility_1.registered_vehicles).to eq([camaro])
      expect(camaro.plate_type).to eq(:antique)
      expect(facility_1.collected_fees).to eq(25)
    end
  end

  describe "registrants can apply for services" do
    it "shows license data for registrant_1" do
      registrant_1 = Registrant.new('Bruce', 18, true )      
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_1.permit?).to eq(true)
    end
    
    it "Registrant 1 can get written test at facility 1" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      registrant_1 = Registrant.new('Bruce', 18, true )      
      
      expect(facility_1.administer_written_test(registrant_1)).to eq(false)
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      
      expect(facility_1.add_service('Written Test')).to eq(["Written Test"])
      expect(facility_1.administer_written_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
    
    it "shows license data for registrant_2" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      registrant_2 = Registrant.new('Penny', 16 )
      
      expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_2.permit?).to eq(false)
    end
    
    it "Registrant 2 can get written test at facility 1" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      registrant_2 = Registrant.new('Penny', 16 )
      
      expect(facility_1.administer_written_test(registrant_2)).to eq(false)
      expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_2.age).to eq(16)
      expect(registrant_2.permit?).to eq(false)

      expect(facility_1.add_service('Written Test')).to eq(["Written Test"])
      expect(facility_1.administer_written_test(registrant_2)).to eq(false)
      
      registrant_2.earn_permit
      
      expect(facility_1.administer_written_test(registrant_2)).to eq(true)
      expect(registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
    
    it "shows license data for registrant_3" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      registrant_3 = Registrant.new('Tucker', 15 )
      
      expect(registrant_3.age).to eq(15)
      expect(registrant_3.permit?).to eq(false)
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
    
    it "Registrant 3 cannot get written test at facility 1" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      registrant_3 = Registrant.new('Tucker', 15 )
      
      expect(facility_1.administer_written_test(registrant_3)).to eq(false)
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
       
      registrant_3.earn_permit
      
      expect(facility_1.add_service('Written Test')).to eq(["Written Test"])
      expect(facility_1.administer_written_test(registrant_3)).to eq(false)
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end
end
