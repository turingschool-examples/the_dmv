require 'spec_helper'
require 'pry'

RSpec.configure do |config|
  config.formatter = :documentation
end

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

  describe '#register' do
    it 'can register a vehicle' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(cruz)

      expect(@facility.vehicle_registered?(cruz)).to be(true)
    end

    it 'will not register a vehicle if the facility does not offer new vehicle registration' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      @facility.register_vehicle(cruz)

      expect(@facility.vehicle_registered?(cruz)).to eq(false)
    end

    it 'will store a new plate type once the vehicle is registered' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(cruz)

      expect(cruz.plate_type).to eq(:regular)
    end

    it 'will store the date the vehicle was registerd on' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(cruz)

      expect(cruz.registration_date).to eq(Date.today)
    end
  end


  describe '#add_service' do
    it 'can add a service' do
      @facility.add_service('Written Test')

      expect(@facility.services).to eq(['Written Test'])
    end
  end

  describe '#cost' do
  it 'can collect fees' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(cruz)

      expect(@facility.collected_fees).to be(100)
    end
  

  it 'can keep count of total fees collected' do
    cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @facility.add_service('Vehicle Registration')
    @facility.register_vehicle(cruz)
    @facility.register_vehicle(bolt)

    expect(@facility.collected_fees).to be(300)
    # binding.pry
    end
  end

  describe '#administer_written_test' do
    it 'can assign a written test to a registrant' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      
      @facility.add_service('Written Test')
      @facility.administer_written_test(registrant_1)

      expect(registrant_1.license_data[:written]).to eq(true)
    end

    it 'will not assign a written test if facility does not offer written tests' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      
      @facility.administer_written_test(registrant_1)
  
      expect(registrant_1.license_data[:written]).to eq(false)
      end

      it 'will not assign a written test if registrant does not have a permit' do
        registrant_2 = Registrant.new('Penny', 16)
        
        @facility.administer_written_test(registrant_2)
    
        expect(registrant_2.license_data[:written]).to eq(false)
        end

    it 'will not assign a written test to anyone under the age of 16' do
      registrant_3 = Registrant.new('Tucker', 15, true )
      
      @facility.administer_written_test(registrant_3)
  
      expect(registrant_3.license_data[:written]).to eq(false)
      end
  end

  describe '#administer_road_test' do
    it 'can assign a road test to a registrant that completed the written test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      @facility.administer_written_test(registrant_1)
      @facility.administer_road_test(registrant_1)

      expect(registrant_1.license_data[:license]).to eq(true)
    end


    it 'will not assign a road test if facility does not offer road tests' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      
      @facility.administer_road_test(registrant_1)

      expect(registrant_1.license_data[:license]).to eq(false)
    end

    it 'will not assign a road_test if registrant has not passed the written test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      
      @facility.add_service('Road Test')
      @facility.administer_road_test(registrant_1)

      expect(registrant_1.license_data[:license]).to eq(false)
    end
  end

  describe '#_renew_drivers_license' do
    it 'can assign a renewed drivers license to a registrant' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      @facility.add_service('Renew License')

      @facility.administer_written_test(registrant_1)
      @facility.administer_road_test(registrant_1)
      @facility.renew_drivers_license(registrant_1)

      expect(registrant_1.license_data[:renewed]).to eq(true)
    end

    it 'can not assign a renewed drivers license to a registrant that has not completed the road test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      
      @facility.add_service('Written Test')
      @facility.administer_written_test(registrant_1)
      @facility.add_service('Renew License')
      @facility.renew_drivers_license(registrant_1)

      expect(registrant_1.license_data[:renewed]).to eq(false)
    end


    it 'will not assign a renewed drivers license if facility does not offer Renew License as a service' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      
      @facility.renew_drivers_license(registrant_1)

      expect(registrant_1.license_data[:renewed]).to eq(false)
    end
  end
end

