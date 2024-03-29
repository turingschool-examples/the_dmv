require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15)
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

  describe '#register_vehicle' do
    it 'can add registered vehicle instances to array' do
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.registered_vehicles).to be_empty

      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])

      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])

      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
    end

    it 'collects fees once vehicles are registered' do
      @facility_1.add_service('Vehicle Registration')
      
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq(25)

      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(225)

      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(325)
    end

    it 'can set plate type of vehicles once registered' do
      @facility_1.add_service('Vehicle Registration')

      expect(@camaro.plate_type).to eq(nil)
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.plate_type).to eq(:antique)

      expect(@bolt.plate_type).to eq(nil)
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.plate_type).to eq(:ev)

      expect(@cruz.plate_type).to eq(nil)
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.plate_type).to eq(:regular)
    end

    it 'can set registration dates of vehicles once registered' do
      @facility_1.add_service('Vehicle Registration')
      expect(@camaro.registration_date).to eq(nil)
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.registration_date).to be_an_instance_of(Date)

      expect(@bolt.registration_date).to eq(nil)
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to be_an_instance_of(Date)

      expect(@cruz.registration_date).to eq(nil)
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to be_an_instance_of(Date)
    end

    describe 'SadPath - Only facilities offering Vehicle Registration can perform service' do
      it 'cannot register vehicles' do
        expect(@facility_2.services).to be_empty
        expect(@facility_2.registered_vehicles).to be_empty

        expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
        expect(@bolt.registration_date).to eq(nil)
        expect(@bolt.plate_type).to eq(nil)

        expect(@facility_2.registered_vehicles).to be_empty
        expect(@facility_2.collected_fees).to eq(0)
      end
    end
  end

  describe '#collect_fees helper' do
    it 'has 0 collected fees to start' do
      expect(@facility_1.collected_fees).to eq(0)
    end

    it 'collects correct amount for antique vehicles' do
      @facility_1.collect_fees(@camaro)
      expect(@facility_1.collected_fees).to eq(25)
    end

    it 'collects correct amount for electric vehicles' do
      @facility_1.collect_fees(@bolt)
      expect(@facility_1.collected_fees).to eq(200)
    end

    it 'collects correct amount for regular vehicles' do
      @facility_1.collect_fees(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
    end
  end

  describe '#set_plate_type helper' do
    it 'sets correct plate type for antique vehicles' do
      expect(@camaro.plate_type).to eq(nil)
      @facility_1.set_plate_type(@camaro)
      expect(@camaro.plate_type).to eq(:antique)
    end

    it 'sets correct plate type for electric vehicles' do
      expect(@bolt.plate_type).to eq(nil)
      @facility_1.set_plate_type(@bolt)
      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'sets correct plate type for regular vehicles' do
      expect(@cruz.plate_type).to eq(nil)
      @facility_1.set_plate_type(@cruz)
      expect(@cruz.plate_type).to eq(:regular)
    end
  end

  describe '#set_registration_date helper' do
    it 'can set correct registration date for each vehicle' do
      expect(@camaro.registration_date).to eq(nil)
      @facility_1.set_registration_date(@camaro)
      expect(@camaro.registration_date).to be_an_instance_of(Date)

      expect(@bolt.registration_date).to eq(nil)
      @facility_1.set_registration_date(@bolt)
      expect(@bolt.registration_date).to be_an_instance_of(Date)

      expect(@cruz.registration_date).to eq(nil)
      @facility_1.set_registration_date(@cruz)
      expect(@cruz.registration_date).to be_an_instance_of(Date)
    end
  end

  describe '#administer_written_test' do
    it 'cannot administer written test without adding that service' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_1.permit?).to be true
      expect(@registrant_1.age >= 16).to be true

      expect(@facility_1.administer_written_test(@registrant_1)).to be false
    end

    it 'can administer written test' do
      @facility_1.add_service('Written Test')

      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_1.permit?).to be true
      expect(@registrant_1.age >= 16).to be true

      expect(@facility_1.administer_written_test(@registrant_1)).to be true
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'cannot administer written test to registrant without a permit' do
      @facility_1.add_service('Written Test')

      expect(@registrant_2.age >= 16).to be true
      expect(@registrant_2.permit?).to be false

      expect(@facility_1.administer_written_test(@registrant_2)).to be false
    end

    it 'can administer written test once registrant has earned permit' do
      @facility_1.add_service('Written Test')

      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to be true

      expect(@facility_1.administer_written_test(@registrant_2)).to be true
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'cannot administer written test to registrant who is younger than 16' do
      @facility_1.add_service('Written Test')

      expect(@registrant_3.age >= 16).to be false
      expect(@registrant_3.permit?).to be false
      expect(@facility_1.administer_written_test(@registrant_3)).to be false

      @registrant_3.earn_permit

      expect(@facility_1.administer_written_test(@registrant_3)).to be false
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end
end
