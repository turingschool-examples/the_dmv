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

  describe '#register_vehicle' do
    it 'can add a vihicle' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
      expect(facility_1.registered_vehicles).to eq([])
      facility_1.register_vehicle(cruz)
      facility_1.register_vehicle(bolt)
      facility_1.register_vehicle(camaro)
      expect(facility_1.registered_vehicles).to eq([cruz, bolt, camaro])
    end
  end

  describe '#collected_fees updates with each vihicle' do
    it 'collects fees' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
     
      expect(facility_1.collected_fees).to eq(0)
      facility_1.register_vehicle(cruz)
      expect(facility_1.collected_fees).to eq(100)
      facility_1.register_vehicle(bolt)
      expect(facility_1.collected_fees).to eq(300)
      facility_1.register_vehicle(camaro)
      expect(facility_1.collected_fees).to eq(325)
    end
  end


  describe 'administer tests works' do

      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )

      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

  
    it 'administer_written_test updates registrant.license_data "Written test if service is available" ' do
      
      expect(registrant_1.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_1.permit?).to be true
      expect(facility_1.administer_written_test(registrant_1)).to be false
      expect(registrant_1.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
      facility_1.add_service('Written Test')
      expect(facility_1.administer_written_test(registrant_1)).to be true
      expect(registrant_1.license_data).to eq ({:written=>true, :license=>false, :renewed=>false})
    end

    it 'administer_written_test does not allow under age or without permit" ' do

      expect(registrant_2.age).to eq(16)
      expect(registrant_2.permit?).to be false 
      expect(facility_1.administer_written_test(registrant_2)).to be false
      registrant_2.earn_permit
      expect(facility_1.administer_written_test(registrant_2)).to be true
      expect(registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      expect(registrant_3.age).to eq(15)
      expect(registrant_3.permit?).to be false
      expect(facility_1.administer_written_test(registrant_3)).to be false
      registrant_3.earn_permit
      expect(facility_1.administer_written_test(registrant_3)).to be false
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'administer_road_test works' do
      expect(facility_1.administer_road_test(registrant_3)).to be false
      registrant_3.earn_permit
      expect(facility_1.administer_road_test(registrant_3)).to be false
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(facility_1.administer_road_test(registrant_1)).to be false 
      expect(facility_1.add_service('Road Test')).to eq(["Written Test", "Road Test"])
      registrant_1.earn_permit
      expect(facility_1.administer_road_test(registrant_1)).to be true
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      expect(facility_1.administer_road_test(registrant_2)).to be true
      expect(registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end

    it ('renew_drivers_license works') do

      expect(facility_1.renew_drivers_license(registrant_1)).to be false
      expect(facility_1.add_service('Renew License')).to eq(["Written Test", "Road Test", "Renew License"])
      expect(facility_1.renew_drivers_license(registrant_1)).to be true
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      expect(facility_1.renew_drivers_license(registrant_3)).to be false
      expect()


    end

  end

end
