require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @mustang = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ev} )
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
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

  describe '#registered_vehicles' do
    it 'has registered vehicles' do
      expect(@facility_1.registered_vehicles).to eq ([])
    end
  end

  describe "#registration_date" do
    it 'doesnt have a registration date' do
      expect(@cruz.registration_date).to eq(nil)
    end

    it 'has a registration date when vehicle is registered' do
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to be_an_instance_of(Date)
    end
  end

  describe 'registration' do
    it 'registers a vehicle' do

      expect(@facility_1.register_vehicle(@cruz)).to eq ([@cruz])
    end
  end

  describe '#collected_fees' do
    it 'stores collected fees' do
      expect(@facility_1.collected_fees).to eq(0)
    end

    it 'collects fees for every registered vehicle' do
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles).to eq([@cruz])
      @facility.fee_assignment(@cruz)
      expect(@facility.collected_fees).to eq 100

      @facility.register_vehicle(@camaro)
      @facility.fee_assignment(@camaro)
      expect(@facility.collected_fees).to eq 125
    end

    it 'collects all fees if meets multiple conditions' do
      @facility.register_vehicle(@mustang)
      @facility.fee_assignment(@mustang)
      expect(@facility.collected_fees).to eq 225
    end

  end

  describe '#plate_type' do
    it 'has a plate type' do
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles).to eq([@cruz])
      @facility.plate_assignment(@cruz)
      expect(@cruz.plate_type).to eq (:regular)
    end
  end

  describe 'vehicle registration process' do
    it 'collects fees and assigns plate types when registered' do

      @facility_2.register_vehicle(@camaro)
      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.registered_vehicles).to eq ([@camaro , @bolt])

      @facility_2.fee_assignment(@camaro)
      @facility_2.fee_assignment(@bolt)
      expect(@facility_2.collected_fees).to eq(225)

      @facility_2.plate_assignment(@camaro)
      @facility_2.plate_assignment(@bolt)
      expect(@camaro.plate_type).to eq (:antique)
      expect(@bolt.plate_type).to eq (:ev)
      #Need to figure out how a vehicle cannot be registered twice and/or at another facility
    end
  end

    describe '#administer_written_test(registrant)' do

        it 'registrant needs to <16, have permit and facility has to add written test as service to administer test' do
          @registrant_1.age
          @registrant_1.permit?
          expect(@facility_1.administer_written_test(@registrant_1)).to eq (false)
          @facility_1.add_service("Written Test")
          expect(@facility_1.services).to eq (["Written Test"])
          expect(@facility_1.administer_written_test(@registrant_1)).to eq (true)
        end

        it 'changes license data' do
          @registrant_1.age
          @registrant_1.permit?
          expect(@facility_1.administer_written_test(@registrant_1)).to eq (false)
          @facility_1.add_service("Written Test")
          expect(@facility_1.services).to eq (["Written Test"])
          expect(@facility_1.administer_written_test(@registrant_1)).to eq (true)
          expect(@registrant_1.license_data[:written]).to eq (true)
        end

        it 'cannot administer written test if registrant does not meed conditions but facility has service' do
          @registrant_2.age
          @registrant_2.permit?
          @facility_2.add_service("Writtent Test")
          expect(@facility_2.administer_written_test(@registrant_2)).to eq (false)
        end

        it 'administer written test if registrant earns permit' do
          @registrant_2.age
          @registrant_2.permit?
          expect(@registrant_2.permit?).to eq(false)
          @registrant_2.earn_permit
          expect(@registrant_2.permit?).to eq(true)
          @facility_2.add_service("Written Test")
          expect(@facility_2.services).to eq (["Written Test"])
          expect(@facility_2.administer_written_test(@registrant_2)).to eq (false)
          expect(@registrant_1.license_data[:written]).to eq (false)
        end
    end
end






