require 'spec_helper'

RSpec.describe Facility do

  before do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
  end

  describe '#initialize' do

    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do

    it 'can add available services' do
      expect(@facility_1.services).to eq([])

      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register vehicle' do

      before do
          @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
          @facility_1.add_service('Vehicle Registration')
      end

     it 'can register a vehicle' do
        expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
     end

     it 'can record the registration date' do
         @facility_1.register_vehicle(@cruz)
         expect(@cruz.registration_date).to eq(Date.today)
     end

     it 'can determine correct plate type' do
         @facility_1.register_vehicle(@cruz)
         expect(@cruz.plate_type).to eq(:regular)
     end

     it 'can register multiple plate types' do
         camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
         @facility_1.register_vehicle(camaro)
         expect(camaro.plate_type).to eq(:antique)
     end

     it 'can charge registration fees' do
         @facility_1.register_vehicle(@cruz)
         expect(@facility_1.collected_fees).to eq(100)
     end

     it 'can charge different amounts for different plate types' do
         bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
         @facility_1.register_vehicle(bolt)
         expect(@facility_1.collected_fees).to eq(200)
     end
  end

  describe '#administer written test' do

      before do
          @facility_1.add_service('Written Test')
      end

      it 'can administer a written test' do
          registrant_1 = Registrant.new('Bruce', 18, true )
          expect(registrant_1.license_data[:written]).to eq(false)

          @facility_1.administer_written_test(registrant_1)

          expect(registrant_1.license_data[:written]).to eq(true)
      end

      it 'only administers written tests for registrants with a permit and are at least 16' do
          registrant_3 = Registrant.new('Tucker', 15 )
          expect(registrant_3.license_data[:written]).to eq(false)

          @facility_1.administer_written_test(registrant_3)

          expect(registrant_3.license_data[:written]).to eq(false)
      end
  end

  describe '#administer a road test' do
      it 'can administer a road test to those who have passed a written test' do
          registrant_1 = Registrant.new('Bruce', 18, true )
          @facility_1.add_service('Written Test')
          @facility_1.add_service('Road Test')
          expect(registrant_1.license_data[:written]).to eq(false)

          @facility_1.administer_written_test(registrant_1)
          expect(registrant_1.license_data[:written]).to eq(true)
          @facility_1.administer_road_test(registrant_1)

          expect(registrant_1.license_data[:license]).to eq(true)
      end
  end

  describe '#permit necessary for written test' do

      before do
          @facility_1.add_service('Written Test')
          @facility_1.add_service('Road Test')
          @facility_1.add_service('Renew License')
          @registrant_2 = Registrant.new('Penny', 16)
      end

     it 'can only give written tests if registrant has a permit' do
         @facility_1.administer_written_test(@registrant_2)
         expect(@registrant_2.permit?).to eq(false)
         expect(@registrant_2.license_data[:written]).to eq(false)

         @registrant_2.earn_permit
         expect(@registrant_2.permit?).to eq(true)

         @facility_1.administer_written_test(@registrant_2)
         expect(@registrant_2.license_data[:written]).to eq(true)
     end
  end

  describe '#license renewal' do
      it 'can renew a license' do
          registrant_1 = Registrant.new('Bruce', 18, true )
          @facility_1.administer_written_test(registrant_1)
          @facility_1.administer_road_test(registrant_1)

          expect(registrant_1.license_data[:renewed]).to eq(false)

          @facility_1.renew_license(registrant_1)

          expect(registrant_1.license_data[:renewed]).to eq(true)
      end

      it 'will not renew if there is no license' do
          registrant_2 = Registrant.new('Penny', 16)

          @facility_1.renew_license(registrant_2)

          expect(registrant_2.license_data[:renewed]).to eq(false)
      end
  end
end
