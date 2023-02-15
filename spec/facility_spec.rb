require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({ name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('Albany DMV Office')
      expect(@facility.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility.phone).to eq('541-967-2014')
      expect(@facility.services).to eq([])
      expect(@facility.registered_vehicles).to eq([])
      expect(@facility.collected_fees).to eq(0)
    end

    it 'can initialize another facility' do
      @facility_2 = Facility.new({ name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@facility_2.name).to eq('Ashland DMV Office')
      expect(@facility_2.address).to eq('600 Tolman Creek Rd Ashland OR 97520')
      expect(@facility_2.phone).to eq('541-776-6092')
      expect(@facility_2.services).to eq([])
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe '#add_service' do
    it 'can add available services' do
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')

      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end
end

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({ name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({ name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({ vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice })
    @bolt = Vehicle.new({ vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev })
    @camaro = Vehicle.new({ vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice })
  end

  describe '#register_vehicle' do
    it 'does not register vehicles if not a listed service' do
      expect(@facility_1.register_vehicle(@cruz)).to eq(nil)
    end

    it 'can register vehicles' do
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@facility_1.collected_fees).to eq(100)
    end
  end

  describe '#make_plate!' do
    it 'can assign a plate type based on the engine type' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.make_plate!(@cruz)).to eq(:regular)
    end

    it 'can return nil if the vehicle is not being registered' do
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.make_plate!(@bolt)).to be_nil
    end
  end

  describe '#collect_fee' do
    it 'can collect the fee based on the engine type' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.collect_fee(@cruz)).to eq(200)
      expect(@facility_1.collected_fees).to eq(200)
    end

    it 'can return nil if the vehicle is not being registered' do
      expect(@facility_1.collect_fee(@bolt)).to eq(nil)
    end
  end
end

RSpec.describe Facility do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15)
    @facility_1 = Facility.new({ name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({ name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
  end

  describe '#administer_written_test' do
    it 'cannot administer written test if facility does not have service' do
      expect(@facility_1.services).to eq([])

      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data).to eq({ written: false, license: false, renewed: false })
    end

    it 'cannot administer written test if registrant does not have permit' do
      expect(@registrant_2.permit?).to eq(false)

      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data).to eq({ written: false, license: false, renewed: false })
    end

    it 'can administer written test if registrant has permit and facility has service' do
      expect(@registrant_1.permit?).to eq(true)

      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)

      expect(@registrant_1.license_data).to eq({ written: true, license: false, renewed: false })
    end
  end

  describe '#administer_road_test' do
    before(:each) do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
    end

    it 'cannot administer road test if road test is not a service' do
      expect(@facility_1.services).to eq(['Written Test'])
      expect(@registrant_1.license_data).to eq({ written: true, license: false, renewed: false })

      @facility_1.administer_road_test(@registrant_1)

      expect(@registrant_1.license_data).to eq({ written: true, license: false, renewed: false })
    end

    it 'cannot administer road test if registrant has not completed written test' do
      @facility_1.add_service('Road Test')
      @facility_1.administer_road_test(@registrant_2)

      expect(@registrant_2.license_data).to eq({ written: false, license: false, renewed: false })
    end

    it 'can administer road test if registrant has completed written test' do
      @facility_1.add_service('Road Test')
      @facility_1.administer_road_test(@registrant_1)

      expect(@registrant_1.license_data).to eq({ written: true, license: true, renewed: false })
    end
  end

  describe '#renew_drivers_license' do
    before(:each) do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
    end

    it 'cannot renew drivers license if it is not a service' do
      expect(@facility_1.services).to eq(['Written Test', 'Road Test'])

      @facility_1.renew_drivers_license(@registrant_1)

      expect(@registrant_1.license_data).to eq({ written: true, license: true, renewed: false })
    end

    it 'cannot renew license if registrant has not received license' do
      @facility_1.add_service('Renew License')
      @facility_1.administer_road_test(@registrant_2)

      expect(@registrant_2.license_data).to eq({ written: false, license: false, renewed: false })
    end

    it 'can renew license if registrant has received license' do
      @facility_1.add_service('Renew License')
      @facility_1.renew_drivers_license(@registrant_1)

      expect(@registrant_1.license_data).to eq({ written: true, license: true, renewed: true })
    end
  end
end
