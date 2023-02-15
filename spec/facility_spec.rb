require 'spec_helper'
require './lib/registrant'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new(
      {   name: 'Albany DMV Office',
          address: '2242 Santiam Hwy SE Albany OR 97321',
          phone: '541-967-2014'
        }
    )
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
  it 'registers vehicle' do
  @facility.add_service('Register a vehicle') 
  cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
  @facility.register_vehicle(cruz)

  expect(@facility.registered_vehicles.empty?).to eq(false)
  expect(cruz.registration_date).to eq(Date.today)
  end

  it 'collects fee' do
 cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
 @facility.add_service('Register a vehicle') 
 @facility.register_vehicle(cruz)
 
  
  expect(@facility.collected_fees).to eq(100)
  end
  
  it 'has plate type' do
  cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
  @facility.add_service('Register a vehicle')
  @facility.register_vehicle(cruz)
    
  expect(cruz.plate_type).to eq(:regular)
  end
end

RSpec.describe Facility do
  before(:each) do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_3 = Registrant.new('Tucker', 15 )
    facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
  end

  it 'administers test' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_3 = Registrant.new('Tucker', 15 )
    facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

    expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

    facility_1.add_service('Written Test')
    facility_1.administer_written_test(registrant_1)

    expect(registrant_1.license_data).to eq({:license=>false, :renewed=>false, :written=>true})
  end

  it 'does not administer written test' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_3 = Registrant.new('Tucker', 15 )
    facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    facility_1.add_service('Written Test')
    registrant_3.earn_permit
    facility_2.administer_written_test(registrant_1) 
    facility_1.administer_written_test(registrant_2) 
    facility_1.administer_written_test(registrant_3) 

    expect(registrant_1.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
    expect(registrant_2.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
    expect(registrant_3.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
  end

  it 'administers road test' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_3 = Registrant.new('Tucker', 15 )
    facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    facility_1.add_service('Road Test')
    facility_1.add_service('Written Test')
    facility_1.administer_written_test(registrant_1) 
    facility_1.administer_road_test(registrant_1)

    expect(registrant_1.license_data).to eq({:license=>true, :renewed=>false, :written=>true})
  end
  
  it 'does not administer road test' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_3 = Registrant.new('Tucker', 15 )
    facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    facility_1.add_service('Road Test')
    facility_1.add_service('Written Test')
    facility_1.administer_written_test(registrant_1) 
    facility_2.administer_road_test(registrant_1)
    facility_1.administer_road_test(registrant_2) 

    expect(registrant_1.license_data).to eq({:license=>false, :renewed=>false, :written=>true})
    expect(registrant_2.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
  end

  it 'renews license' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_3 = Registrant.new('Tucker', 15 )
    facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    facility_1.add_service('Road Test')
    facility_1.add_service('Written Test')
    facility_1.add_service('Renew License')
    facility_1.administer_written_test(registrant_1) 
    facility_1.administer_road_test(registrant_1)
    facility_1.renew_license(registrant_1)

    expect(registrant_1.license_data).to eq({:license=>true, :renewed=>true, :written=>true})
  end

  it 'does not renew license' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_3 = Registrant.new('Tucker', 15 )
    facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    facility_1.add_service('Road Test')
    facility_1.add_service('Written Test')
    facility_1.add_service('Renew License')
    facility_1.administer_written_test(registrant_1) 
    facility_1.administer_road_test(registrant_1)
    facility_2.renew_license(registrant_1)
    facility_1.administer_road_test(registrant_2)

    expect(registrant_1.license_data).to eq({:license=>true, :renewed=>false, :written=>true})
    expect(registrant_2.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
  end
end
