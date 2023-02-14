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
   
    it 'return empty array for registered vehiciles' do
      expect(@facility.registered_vehicles).to eq([])
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

    it 'DMV can register a vehicle' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      facility_1.add_service('Vehicle Registration')

      expect(facility_1.register_vehicle(cruz)).to eq([cruz]) 
    end

    it 'has correct registration date' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility.register_vehicle(cruz)
      
      expect(cruz.registration_date).to eq(cruz.registration_date)
    end

    it 'has plate type' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      expect(camaro.plate_type).to eq(:antique)
      expect(cruz.plate_type).to eq(:regular)
    end

    it 'can collect fees' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(cruz)
      @facility.register_vehicle(camaro)
      
      expect(@facility.collected_fees).to eq(125)
    end
  end

  it 'can administer written test' do 
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 15 )
    @facility.add_service('Written Test')

    expect(@facility.administer_written_test(registrant_1)).to eq true
    expect(@facility.administer_written_test(registrant_2)).to eq false
  end

  it 'can administer road test' do 
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 15 )
    @facility.add_service('Road Test')
    @facility.add_service('Written Test')
    @facility.administer_written_test(registrant_1)
    @facility.administer_written_test(registrant_2)

    expect(@facility.administer_road_test(registrant_1)).to eq true
    expect(@facility.administer_road_test(registrant_2)).to eq false
  end

  it 'can renew lisence' do 
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 15 )
    @facility.add_service('Renew License')
    @facility.add_service('Road Test')
    @facility.add_service('Written Test')
    @facility.administer_written_test(registrant_1)
    @facility.administer_written_test(registrant_2)
    @facility.administer_road_test(registrant_1)
    @facility.administer_road_test(registrant_2)
  
    expect(@facility.renew_drivers_license(registrant_1)).to eq true
    expect(@facility.renew_drivers_license(registrant_2)).to eq false
  end
end
