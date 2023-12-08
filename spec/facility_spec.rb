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

  describe '#plate_maker' do
    it 'makes an antique plate when vehicle is over 25 years old' do
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

      @facility.plate_maker(camaro)

      expect(camaro.plate_type).to eq(:antique)
    end

    it 'makes an ev plate when vehicle is an ev engine' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})

      @facility.plate_maker(bolt)

      expect(bolt.plate_type).to eq(:ev)
    end

    it 'makes a regular plate when a vehicle is newer than 25 years and is not an ev engine' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility.plate_maker(cruz)

      expect(cruz.plate_type).to eq(:regular)
    end
  end

  describe '#register_vehicle' do
    it 'starts with no registered vehicles' do
      expect(@facility.registered_vehicles).to eq([])
    end

    it 'can keep track of a vehicle it has registered' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility.register_vehicle(cruz)

      expect(@facility.registered_vehicles).to eq([cruz])
    end

    it 'gives a vehicle a registration date when registered' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility.register_vehicle(cruz)

      expect(cruz.registration_date).to eq(Date.today)
    end

    it 'gives a vehicle a plate type of :regular when registered as an :ice engine' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility.register_vehicle(cruz)

      expect(cruz.plate_type).to eq(:regular)
    end

    it 'gives a vehicle a plate type of :antique when registered if vehicle is over 25 years old' do
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

      @facility.register_vehicle(camaro)

      expect(camaro.plate_type).to eq(:antique)
    end

    it 'gives a vehicle a plate type of :ev when registered if vehicle has :ev engine:' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})

      @facility.register_vehicle(bolt)

      expect(bolt.plate_type).to eq(:ev)
    end
  end

  describe '#collected_fees'
    it 'starts with no collected fees' do
      expect(@facility.collected_fees).to eq(0)
    end

    it 'collects 100 dollars when registering a car with :regular plates' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility.register_vehicle(cruz)

      expect(@facility.collected_fees).to eq(100)
    end

    it 'collects 25 dollars when registering a car with :antique plates' do
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

      @facility.register_vehicle(camaro)

      expect(@facility.collected_fees).to eq(25)
    end

    it 'collects 200 dollars when registering a car with :ev plates' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})

      @facility.register_vehicle(bolt)

      expect(bolt.collected_fees).to eq(:200)
    end

    it 'can collects fees from multiple registrations' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility.register_vehicle(bolt)
      @facility.register_vehicle(camaro)
      @facility.register_vehicle(cruz)

      expect(@facility.collected_fees).to eq(325)
    end
  end

  describe '#fee_collector' do
    it 'collects 100 dollars when registering a car with :regular plates' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      @facility.fee_collector(cruz)

      expect(@facility.collected_fees).to eq(100)
    end

    it 'collects 25 dollars when registering a car with :antique plates' do
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

      @facility.fee_collector(camaro)

      expect(@facility.collected_fees).to eq(25)
    end

    it 'collects 200 dollars when registering a car with :ev plates' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})

      @facility.register_vehicle(bolt)

      expect(bolt.collected_fees).to eq(:200)
    end
  end
end
