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

  before(:each) do
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

  end
  describe '#register_vehicle(vehicle)' do
    it 'checks for services offered' do
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.services).to eq(['Vehicle Registration'])
      expect(@facility_2.services).to eq([])
    end
    
    it '#collect_fees(vehicle) when registering' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.collected_fees).to eq(0)
      
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
      expect(@facility_2.collected_fees).to eq(0)
    end

    it '#changes_registration_date of vehicle' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today)
    end

    it '#establish_plate_type of vehicle' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@cruz.plate_type).to eq(:regular)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'if offered at facility, returns an array of registered vehicles' do
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
      expect(@facility_1.register_vehicle(@camaro)).to eq([@cruz, @camaro])
    end
  end

  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
  end

  describe '#administer written test' do
    it 'checks facility services in order to administer tests' do
      @facility_1.add_service('Written Test')
      
      expect(@facility_1.services).to eq(['Written Test'])
      expect(@facility_2.services).to eq([])
    end

    it 'checks if registrants are qualified for written test' do
      @facility_1.add_service('Written Test')
    
      expect(@registrant_1.permit?).to eq(true)
      expect(@registrant_1.age).to eq(18)
      expect(@facility_1.qualified_for_written_test(@registrant_1)).to eq(true)
    end
    
    it 'can administer written tests and updates license data' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
  end

  describe '#road test' do
    xit 'checks facility services for road test' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_1.add_service('Road Test')

      expect(facility_1.services).to eq(['Road Test'])
    end

    xit 'administers road test for qualified registrants and updates license data' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_3 = Registrant.new('Tucker', 15 )
      facility_1.add_service('Road Test')
      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)
    
      expect(facility_1.administer_road_test(registrant_1)).to eq(true)
      expect(facility_1.administer_road_test(registrant_3)).to eq(false)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end

  describe '#renew license' do
    xit 'checks facility services for renew license' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_1.add_service('Renew License')

      expect(facility_1.services).to eq(['Renew License'])
    end

    xit 'renews license for qualified registrants' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      registrant_1 = Registrant.new('Bruce', 18, true )
      facility_1.add_service('Road Test')
      facility_1.add_service('Written Test')
      facility_1.add_service('Renew License')
      facility_1.administer_written_test(registrant_1)
      facility_1.administer_road_test(registrant_1)

      expect(facility_1.renew_drivers_license(registrant_1)).to eq(true)
      expect(facility_2.renew_drivers_license(registrant_1)).to eq(false)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end
  end
end
