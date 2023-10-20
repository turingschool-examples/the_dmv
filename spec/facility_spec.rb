require 'spec_helper'
require './lib/facility'
require './lib/vehicle'
require './lib/registrant'
require 'date'
require 'pry'

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
  
  it 'can contain data in hash' do
    facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

    expect(facility_1).to be_an_instance_of(Facility)
    expect(facility_1.name).to eq('DMV Tremont Branch')
    expect(facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
    expect(facility_1.phone).to eq('(720) 865-4600')
    expect(facility_1.services).to eq([])
  end

  it 'can add services' do
    facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    facility_1.add_service('Vehicle Registration')

    expect(facility_1.services).to eq(['Vehicle Registration'])
  end

  it 'can obtain vehicle data' do
    cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    expect(cruz.vin).to eq('123456789abcdefgh')
    expect(bolt.year).to eq(2019)
    expect(camaro.make).to eq('Chevrolet')
    expect(cruz.registration_date).to eq(nil)
  end

  it 'can register vehicles at DMV branches' do
    facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

    cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    expect(facility_1.register_vehicle(cruz)).not_to eq([])
    expect(facility_1.register_vehicle(bolt)).not_to eq([])
    expect(facility_1.register_vehicle(camaro)).not_to eq([])
  end

  it 'can register vehicles and collect fees' do
    facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

    cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    facility_1.register_vehicle(cruz)
    facility_1.register_vehicle(bolt)
    facility_1.register_vehicle(camaro)
    
    expect(facility_1.collected_fees).to eq(325)
  end

  it 'can register vehicles at DMV branches with plates' do
    facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
  
    cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    facility_1.register_vehicle(cruz)
    facility_1.register_vehicle(bolt)
    facility_1.register_vehicle(camaro)

    expect(facility_1.plate_type_for_vehicle(cruz)).to eq(@plate_type=:regular)
    expect(facility_1.plate_type_for_vehicle(bolt)).to eq(@plate_type=:ev)
    expect(facility_1.plate_type_for_vehicle(camaro)).to eq(@plate_type=:antique)
  end

  it 'can register vehicles at DMV branches with plates' do
    facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
  
    cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    facility_1.register_vehicle(cruz)
    facility_1.register_vehicle(bolt)
    facility_1.register_vehicle(camaro)

    expect(cruz.registration_date).to be_an_instance_of(DateTime)
    expect(bolt.registration_date).to be_an_instance_of(DateTime)
    expect(camaro.registration_date).to be_an_instance_of(DateTime)
  end

  it 'can access registrants in spec file' do
    facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_3 = Registrant.new('Tucker', 15 )

    expect(registrant_1).to be_an_instance_of(Registrant)
    expect(registrant_2).to be_an_instance_of(Registrant)
    expect(registrant_3).to be_an_instance_of(Registrant)
  end

  it 'can administer written tests correctly' do
    facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_3 = Registrant.new('Tucker', 15 )

    facility_1.add_service('Written Test')
    
    registrant_3.earn_permit
    
    expect(facility_1.administer_written_test(registrant_1)).to eq(true)
    expect(facility_1.administer_written_test(registrant_2)).to eq(false)
    expect(facility_1.administer_written_test(registrant_3)).to eq(false)
    expect(facility_2.administer_written_test(registrant_1)).to eq(false)
    expect(facility_1.administer_written_test(registrant_3)).to eq(false)
  end
end
