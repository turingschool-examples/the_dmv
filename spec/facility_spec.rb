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

  describe 'registered_vehicles' do
    it 'can list registered vehicles' do
      expect(@facility.registered_vehicles).to eq([])
      @facility.add_service('Vehicle Registration')
      
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )

      @facility.register_vehicle(cruz)
      @facility.register_vehicle(bolt)
      expect(@facility.registered_vehicles).to eq([cruz, bolt])
    end
  end

  describe 'register_vehicle' do
    it 'can register a vehicle' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(cruz)

      expect(@facility.registered_vehicles).to eq([cruz])
      expect(@facility.collected_fees).to eq(100)
      expect(cruz.plate_type).to eq("regular")
      expect(cruz.registration_date).to eq(Date.today)
    end
  end

  describe 'registration_fee' do
    it 'can calculate registration fee and update collected fees' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      @facility.registration_fee(cruz)

      expect(@facility.collected_fees).to eq(100)
    end

    # it 'updates collected fees' do
    #   cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    #   @facility.register_vehicle(cruz)
    #   expect(@facility.collected_fees).to eq(100)
    # end
  end

  describe 'update_plate_type' do
    it 'can update plate type' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      cruz.update_plate_type(cruz)

      expect(cruz.plate_type).to eq('regular')
    end
  end

  describe 'update_registered_vehicles' do
    it 'can update array of vehicles' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      @facility.update_registered_vehicles(cruz)

      expect(@facility.registered_vehicles).to eq([cruz])
    end
  end

  describe 'administer_written_test' do
    it 'administer test and update license_data' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      @facility.add_service('Written Test')

      @facility.administer_written_test(registrant_1)

      expect(registrant_1.license_data[:written]).to eq(true)
    end
  end

  describe 'administer_road_test' do
    it 'administer test and update license_data' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      @facility.add_service('Written Test')
      @facility.add_service('Driving Test')

      @facility.administer_written_test(registrant_1)
      @facility.administer_road_test(registrant_1)

      expect(registrant_1.license_data[:license]).to eq(true)
    end
  end

  describe 'renew_drivers_license' do
    it 'renew license if someone is a licensed driver' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      @facility.add_service('Written Test')
      @facility.add_service('Driving Test')
      @facility.add_service('License Renewal')

      @facility.administer_written_test(registrant_1)
      @facility.administer_road_test(registrant_1)
      @facility.renew_drivers_license(registrant_1)
      
      expect(registrant_1.license_data[:renewed]).to eq(true)
    end
  end

  # FAILING TESTS DUE TO MISSING SERVICE

  describe 'Facility does not offer this service' do
    it 'returns message when service is not available' do

      registrant_1 = Registrant.new('Bruce', 18, true )

      expect(@facility.administer_written_test(registrant_1)).to eq("Facility does not offer this service")
    end
  end

  describe 'Facility does not offer this service' do
    it 'returns message when service is not available' do

      registrant_1 = Registrant.new('Bruce', 18, true )

      expect(@facility.administer_road_test(registrant_1)).to eq("Facility does not offer this service")
    end
  end

  describe 'Facility does not offer this service' do
    it 'returns message when service is not available' do

      registrant_1 = Registrant.new('Bruce', 18, true )

      expect(@facility.renew_drivers_license(registrant_1)).to eq("Facility does not offer this service")
    end
  end

  describe 'Facility does not offer this service' do
    it 'returns message when service is not available' do

      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      expect(@facility.register_vehicle(cruz)).to eq("Facility does not offer this service")
    end
  end

  # TEST FOR FLIPPED EXPECTATION

  describe 'administer_road_test' do
    it 'it DOES NOT allow road test if no written completed' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      @facility.add_service('Written Test')
      @facility.add_service('Driving Test')

      expect(@facility.administer_road_test(registrant_1)).to eq("applicant is not eligible for license")
    end
  end

  # TEST FOR API DATA
  describe 'can add from colorado data' do
    it 'can add facilities from colorado data' do
      co_facility = Facility.new(DmvDataService.new.co_dmv_office_locations)

      co_facility.add_service(co_facility.services[0])
      
      expect(co_facility.services).to eq(['vehicle titles'])
    end
  end
end
