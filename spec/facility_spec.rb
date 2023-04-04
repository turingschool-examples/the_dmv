require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('Albany DMV Office')
      expect(@facility.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility.phone).to eq('541-967-2014')
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
  
  describe '#register_vehicle' do
    before(:each) do
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      @facility_1.add_service('Vehicle Registration')
    end
    it 'can register a vehicle if the facility provides service' do
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
      expect(@facility_2.register_vehicle(@cruz)).to eq(nil)

      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      @facility_2.register_vehicle(@cruz)


      expect(@facility_1.registered_vehicles).to eq([@cruz, @bolt, @camaro])
      expect(@facility_2.registered_vehicles).to eq([])

      @facility_2.add_service('Vehicle Registration')

      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'can check for registration date' do
      expect(@cruz.registration_date).to eq(nil)
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
      expect(@cruz.registration_date).to eq(Date.today)
    end

    it 'can collect fees' do
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      @facility_2.register_vehicle(@cruz)

      expect(@facility_1.collected_fees).to eq(325)
      expect(@facility_2.collected_fees).to eq(0)
    end

    it 'can set vehicle plate type' do

      expect(@cruz.plate_type).to eq(:regular)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@camaro.plate_type).to eq(:antique)
    end
  end

  describe 'Drivers License' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 16 )
      @registrant_3 = Registrant.new('Tucker', 15 )
      @facility_1 = Facility.new(
        {
          name: 'Albany DMV Office', 
          address: '2242 Santiam Hwy SE Albany OR 97321', 
          phone: '541-967-2014' })
      @facility_2 = Facility.new(
        {
          name: 'Ashland DMV Office', 
          address: '600 Tolman Creek Rd Ashland OR 97520', 
          phone: '541-776-6092' })

    end
    
  describe '#administer written test' do
    it 'will administer the written test if service is provided' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@facility_1.administer_written_test(@registrant_1)).to be(false)
      expect(@facility_2.administer_written_test(@registrant_1)).to be(false)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @facility_1.add_service('Written Test')

      expect(@facility_1.administer_written_test(@registrant_1)).to be(true)
      expect(@facility_2.administer_written_test(@registrant_1)).to be(false)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

    end
    it 'can administer a test and reject based on qualifiers' do
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_1)

      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit?).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)

      @registrant_2.earn_permit

      expect(@facility_1.administer_written_test(@registrant_2)).to eq(true)
      expect(@registrant_2.license_data).to eq({ written: true, license: false, renewed: false })

      expect(@registrant_3.age).to eq(15)
      expect(@registrant_3.permit?).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)

      @registrant_3.earn_permit

      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
      expect(@registrant_3.license_data).to eq({ written: false, license: false, renewed: false })
    end

  end

  describe '#administer_road_test' do
    it 'will adminitister the road test' do

    expect(@facility_1.administer_road_test(@registrant_1)).to be false
    expect(@facility_2.administer_road_test(@registrant_1)).to be false

    @facility_1.add_service('Written Test')
    @facility_1.add_service('Road Test')
    @facility_1.administer_written_test(@registrant_1)
  end
  
  end

end
end
