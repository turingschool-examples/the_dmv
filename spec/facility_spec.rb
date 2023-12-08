require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
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

  describe '#plate_maker' do
    it 'makes an antique plate when vehicle is over 25 years old' do
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

      @facility_1.plate_maker(camaro)

      expect(camaro.plate_type).to eq(:antique)
    end

    it 'makes an ev plate when vehicle is an ev engine' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})

      @facility_1.plate_maker(bolt)

      expect(bolt.plate_type).to eq(:ev)
    end

    it 'makes a regular plate when a vehicle is newer than 25 years and is not an ev engine' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility_1.plate_maker(cruz)

      expect(cruz.plate_type).to eq(:regular)
    end
  end

  describe '#register_vehicle' do
    it 'starts with no registered vehicles' do
      expect(@facility_1.registered_vehicles).to eq([])
    end

    it 'can keep track of a vehicle it has registered' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility_1.register_vehicle(cruz)

      expect(@facility_1.registered_vehicles).to eq([cruz])
    end

    it 'gives a vehicle a registration date when registered' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility_1.register_vehicle(cruz)

      expect(cruz.registration_date).to eq(Date.today)
    end

    it 'gives a vehicle a plate type of :regular when registered as an :ice engine' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility_1.register_vehicle(cruz)

      expect(cruz.plate_type).to eq(:regular)
    end

    it 'gives a vehicle a plate type of :antique when registered if vehicle is over 25 years old' do
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

      @facility_1.register_vehicle(camaro)

      expect(camaro.plate_type).to eq(:antique)
    end

    it 'gives a vehicle a plate type of :ev when registered if vehicle has :ev engine:' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})

      @facility_1.register_vehicle(bolt)

      expect(bolt.plate_type).to eq(:ev)
    end
  end

  describe '#collected_fees' do
    it 'starts with no collected fees' do
      expect(@facility_1.collected_fees).to eq(0)
    end

    it 'collects 100 dollars when registering a car with :regular plates' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility_1.register_vehicle(cruz)

      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'collects 25 dollars when registering a car with :antique plates' do
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

      @facility_1.register_vehicle(camaro)

      expect(@facility_1.collected_fees).to eq(25)
    end

    it 'collects 200 dollars when registering a car with :ev plates' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})

      @facility_1.register_vehicle(bolt)

      expect(@facility_1.collected_fees).to eq(200)
    end

    it 'can collects fees from multiple registrations' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility_1.register_vehicle(bolt)
      @facility_1.register_vehicle(camaro)
      @facility_1.register_vehicle(cruz)

      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#fee_collector' do
    it 'collects 100 dollars when registering a car with :regular plates' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility_1.plate_maker(cruz)
      @facility_1.fee_collector(cruz)

      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'collects 25 dollars when registering a car with :antique plates' do
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

      @facility_1.plate_maker(camaro)
      @facility_1.fee_collector(camaro)

      expect(@facility_1.collected_fees).to eq(25)
    end

    it 'collects 200 dollars when registering a car with :ev plates' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})

      @facility_1.plate_maker(bolt)
      @facility_1.fee_collector(bolt)

      expect(@facility_1.collected_fees).to eq(200)
    end
  end

  describe '#administer_written_test(registrant)' do
    it 'can not administer a written test if it does not offer that service' do
      @facility_1.administer_written_test(@registrant_1)

      expect(@registrant_1.license_data[:written]).to eq(false)
    end

    it 'can not administer a written test to someone without their permit' do
      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data[:written]).to eq(false)
    end

    it 'can administer a written test to a registrant if it offers the service' do
      @facility_1.add_service("Written Test")

      @facility_1.administer_written_test(@registrant_1)
      
      expect(@registrant_1.license_data[:written]).to eq(true)
    end

    it 'can administer a written test to a registrant if it has earned a permit' do
      @facility_1.add_service("Written Test")

      @registrant_2.earn_permit

      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data[:written]).to eq(true)
    end

    it 'will not administer a written test to someone who is under 16 years old' do
      @facility_1.add_service("Written Test")

      expect(@registrant_3.license_data[:written]).to eq(false)

      @registrant_3.earn_permit

      @facility_1.administer_written_test(@registrant_3)

      expect(@registrant_3.license_data[:written]).to eq(false)
    end
  end

  describe '#administer_road_test' do
    it 'can not administer a road test if it does not offer that service' do
    @facility_1.administer_road_test(@registrant_1)

    expect(@registrant_1.license_data[:license]).to eq(false)
  end

    it 'can not administer a road test to someone without their having passed their written test' do
      @facility_1.administer_road_test(@registrant_2)

      @registrant_2.earn_permit

      expect(@registrant_2.license_data[:license]).to eq(false)
    end

    it 'can administer a road test to a registrant if it offers the service and they have passed written test' do
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")

      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      
      expect(@registrant_1.license_data[:license]).to eq(true)
    end
  end

  describe '#renew_drivers_license'
    it 'can not renew drivers license unless it offers that service' do
      @facility_1.renew_drivers_license(@registrant_1)

      expect(@registrant_1.license_data[:renewed]).to eq(false)
    end

    it 'can not renew drivers license unless registrant has passed both written and road test' do
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Renew License")

      @facility_1.administer_written_test(@registrant_1)

      expect(@registrant_1.license_data[:written]).to eq(true)

      @facility_1.renew_drivers_license(@registrant_1)

      expect(@registrant_1.license_data[:renewed]).to eq(false)
    end

    it 'can renew a drivers license if it offers the service and the registrant has passed their road test' do
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Renew License")
      @facility_1.add_service("Road Test")

      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      @facility_1.renew_drivers_license(@registrant_1)

      expect(@registrant_1.license_data[:renewed]).to eq(true)
    end
  end
end
