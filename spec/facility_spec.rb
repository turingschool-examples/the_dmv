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

  describe 'Has registration date, registered vehicles, and collected fees' do
    it 'Has registration date, registered vehicles, and collected fees' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      facility_1.add_service('Vehicle Registration')

      expect(cruz.registration_date).to eq(nil)
      expect(facility_1.registered_vehicles).to eq([])
      expect(facility_1.collected_fees).to eq(0)
    end
  end

  describe 'Can register vehicles' do
    it 'Can register vehicles with correct list, date, plate type, and fees' do
    facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    
    expect(facility_1.register_vehicle(cruz)).to eq(nil)
    
    facility_1.add_service('Vehicle Registration')

    expect(facility_1.register_vehicle(cruz)).to eq(facility_1.registered_vehicles)
    expect(facility_1.register_vehicle(camaro)).to eq(facility_1.registered_vehicles)
    expect(facility_1.register_vehicle(bolt)).to eq(facility_1.registered_vehicles)
    expect(cruz.registration_date).to be_a(Date)
    expect(camaro.registration_date).to be_a(Date)
    expect(bolt.registration_date).to be_a(Date)
    expect(cruz.plate_type).to eq(:regular)
    expect(camaro.plate_type).to eq(:antique)
    expect(bolt.plate_type).to eq(:ev)
    expect(facility_1.registered_vehicles).to eq([cruz, camaro, bolt])
    expect(facility_1.collected_fees).to eq(325)
    end
  end

  describe 'Cannot double register' do
    it 'will not let vehicle register at 2 facilities' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      facility_1.add_service('Vehicle Registration')
      facility_1.register_vehicle(cruz)
      facility_1.register_vehicle(camaro)
      facility_1.register_vehicle(bolt)
    
      expect(facility_2.register_vehicle(bolt)).to eq(nil)
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.collected_fees).to eq(0)
    end
  end

  describe 'Can manage License data properly' do
    it 'has working written test' do
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 16)
    registrant_3 = Registrant.new('Tucker', 15)
    facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    
    expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    expect(registrant_1.permit?).to eq(true)
    expect(facility_1.administer_written_test(registrant_1)).to eq(false)
    expect(facility_1.add_service('Written Test')).to eq(["Written Test"])
    expect(facility_1.administer_written_test(registrant_1)).to eq(true)
    expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    expect(facility_1.administer_written_test(registrant_2)).to eq(false)

    registrant_2.earn_permit

    expect(facility_1.administer_written_test(registrant_2)).to eq(true)
    expect(registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

    registrant_3.earn_permit

    expect(facility_1.administer_written_test(registrant_3)).to eq(false)
    end
  end

  describe 'Can adminiter road test' do
    it 'Cannot take test without service' do
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 16)
    registrant_3 = Registrant.new('Tucker', 15)
    facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    registrant_3.earn_permit

    expect(facility_1.administer_road_test(registrant_3)).to eq(false)
    expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    expect(facility_1.administer_road_test(registrant_1)).to eq(false)
    end

    it 'can take road test with service' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 16)
      registrant_3 = Registrant.new('Tucker', 15)
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })        
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      registrant_2.earn_permit
      facility_1.add_service('Road Test')
      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)
      facility_1.administer_written_test(registrant_2)

      expect(facility_1.administer_road_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      expect(facility_1.administer_road_test(registrant_2)).to eq(true)
      expect(registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
    
    it 'cannot renew license without service' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 16)
      registrant_3 = Registrant.new('Tucker', 15)
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })        
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      registrant_2.earn_permit
      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)
      facility_1.administer_written_test(registrant_2)

      expect(facility_1.renew_drivers_license(registrant_1)).to eq(false)
    end

    it 'can renew license' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 16)
      registrant_3 = Registrant.new('Tucker', 15)
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })        
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      registrant_2.earn_permit
      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)
      facility_1.administer_written_test(registrant_2)
      facility_1.add_service('Road Test')
      facility_1.administer_road_test(registrant_1)
      facility_1.administer_road_test(registrant_2)
      facility_1.add_service('Renew License')

      expect(facility_1.services).to eq(["Written Test", "Road Test", "Renew License"])
      expect(facility_1.renew_drivers_license(registrant_1)).to eq(true)
      expect(facility_1.renew_drivers_license(registrant_2)).to eq(true)
      expect(facility_1.renew_drivers_license(registrant_3)).to eq(false)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      expect(registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end
  end

  describe 'Can import facilities' do
    it 'can use external facility data' do
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @facility.add_facilities(new_york_facilities)

    expect(@facility.facility_count).to eq(169)
    end

    it 'can use multiple external facility datasets' do
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    @facility.add_facilities(new_york_facilities)
    @facility.add_facilities(missouri_facilities)
      
    expect(@facility.facility_count).to eq(169 + 178)
    end
  end
end