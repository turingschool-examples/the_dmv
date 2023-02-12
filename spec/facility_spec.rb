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

  describe '#register vehicles' do
    it 'can register vehicles' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      facility_1.add_service('Vehicle Registration')
      facility_1.register_vehicle(cruz)
      expect(facility_1.registered_vehicles).to eq([cruz])
    end

    it 'has a vehicle registration date' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      facility_1.add_service('Vehicle Registration')
      facility_1.register_vehicle(cruz)
      expect(cruz.registration_date).to be_an_instance_of(Date)
    end

    it 'can assign plate type' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      facility_1.add_service('Vehicle Registration')
      facility_1.register_vehicle(cruz)
      facility_1.register_vehicle(bolt)
      facility_1.register_vehicle(camaro)

      expect(cruz.plate_type).to eq(:regular)
      expect(bolt.plate_type).to eq(:ev)
      expect(camaro.plate_type).to eq(:antique)
    end

    it 'can collect fees' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      facility_1.add_service('Vehicle Registration')

      expect(facility_1.collected_fees).to eq(0)

      facility_1.register_vehicle(cruz)
      facility_1.register_vehicle(bolt)
      facility_1.register_vehicle(camaro)

      expect(facility_1.collected_fees).to eq(325)
    end
  end

  describe '#administer written test' do
    it 'can give written test' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )

      facility_1.administer_written_test(registrant_1)
      expect(registrant_1.license_data[:written]).to eq(false)

      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)
      expect(registrant_1.license_data[:written]).to eq(true)

      facility_1.administer_written_test(registrant_2)
      expect(registrant_2.license_data[:written]).to eq(false)
    end
  end

  describe '#administer road test' do
    it 'can give road test' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      registrant_1 = Registrant.new('Bruce', 18, true )
     
      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)
      
      facility_1.administer_road_test(registrant_1)
      expect(registrant_1.license_data[:license]).to eq(false)

      facility_1.add_service('Road Test')
      facility_1.administer_road_test(registrant_1)
      expect(registrant_1.license_data[:license]).to eq(true)
    end
  end

  describe '#renew a license' do
    it 'can renew a license' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      registrant_1 = Registrant.new('Bruce', 18, true )

      facility_1.renew_drivers_license(registrant_1)
      expect(registrant_1.license_data[:renewed]).to eq(false)

      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)
      
      facility_1.add_service('Road Test')
      facility_1.administer_road_test(registrant_1)
      
      facility_1.add_service('Renew License')
      facility_1.renew_drivers_license(registrant_1)

      expect(registrant_1.license_data[:renewed]).to eq(true)
    end
  end

     

end
