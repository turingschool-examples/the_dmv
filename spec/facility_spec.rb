require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
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

  it 'checks pre-registration which should return NIL' do
    @facility_1.add_service('Vehicle Registration')
    expect(@cruz.registration_date).to eq(nil)
  end

  it 'returns initial list of registered vehicles from facility 1 and no collected fees' do
    @facility_1.add_service('Vehicle Registration')
    expect(@facility_1.registered_vehicles).to eq([])
    expect(@facility_1.collected_fees).to eq(0)
  end

  it 'checks the plate type and updates collected fees' do
    @facility_1.add_service('Vehicle Registration')
    @facility_1.register_vehicle(@cruz)
    expect(@cruz.plate_type).to be(:regular)
    expect(@facility_1.collected_fees).to be(100)
  end

  # it 'can register a second vehicle of camaro and due to its year date return an antique' do
  #   facility_1.add_service('Vehicle Registration')
  #   facility_1.register_vehicle(camaro)
  #   expect(camaro.plate_type).to be(:antique)
  # end

  # it 'can register a third vehicle of bolt and due to its year date return an ev' do
  #   facility_1.add_service('Vehicle Registration')
  #   facility_1.register_vehicle(bolt)
  #   expect(bolt.plate_type).to be(:ev)
  # end

  # it 'updates list of facility registered vehicles and updates collected fees' do
  #   facility_1.add_service('Vehicle Registration')
  #   facility_1.register_vehicle(cruz)
  #   facility_1.register_vehicle(camaro)
  #   facility_1.register_vehicle(bolt)
  #   expect(facility_1.registered_vehicles.count).to eq(3)
  #   expect(facility_1.collected_fees).to be(325)
  # end

  # it 'checks that facility 2 has no registered vehicles or services' do
  #   expect(facility_2.registered_vehicles).to eq([])
  #   expect(facility_2.services).to eq([])
  # end

  # it 'makes sure that vehicle cannot be re-registered after initial registration in vehicle 1' do
  #   facility_2.register_vehicle(bolt)
  #   expect(facility_2.registered_vehicles).to eq([])
  #   expect(facility_2.collected_fees).to eq(0)
  # end





end



@facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    @facility_1.add_service('Vehicle Registration')