require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )

  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('Albany DMV Office')
      expect(@facility.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility.phone).to eq('541-967-2014')
      expect(@facility.services).to eq([])
      expect(@facility.registered_vehicles).to eq([])
      expect(@facility.collected_fees).to eq 0
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

  describe '#register vehicle' do
    it 'may offer vehicle registration' do
      expect(@facility_1.add_service('Vehicle Registration')).to eq(["Vehicle Registration"])
      expect(@cruz.registration_date).to be nil
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq 0

      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@facility_1.collected_fees).to eq 100

      expect(@facility_1.register_vehicle(@camaro)).to eq([@cruz, @camaro])
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)

      expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz, @camaro, @bolt])
      expect(@bolt.registration_date).to eq (Date.today)
      expect(@bolt.plate_type).to eq(:ev)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@facility_1.collected_fees).to eq 325
    end

    it 'is does not offer registration' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  # Written test
  it 'can change licence data to true' do
    expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    expect(@registrant_1.permit?).to be true

    expect(@facility_1.administer_written_test(@registrant_1)).to be false
    expect(@facility_1.add_service('Written Test')).to eq(['Written Test'])
    expect(@facility_1.administer_written_test(@registrant_1)).to be true
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

  end

  it 'can only administer a written test if registrant earns a permit' do
    @facility_1.add_service('Written Test')

    expect(@registrant_2.age).to eq 16
    expect(@registrant_2.permit?).to be false
    expect(@facility_1.administer_written_test(@registrant_2)).to be false

    @registrant_2.earn_permit

    expect(@facility_1.administer_written_test(@registrant_2)).to be true
    expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
  end

  it 'will not give a written test if age < 16' do
    @facility_1.add_service('Written Test')

    expect(@registrant_3.age).to eq 15
    expect(@registrant_3.permit?).to be false
    expect(@facility_1.administer_written_test(@registrant_3)).to be false

    @registrant_3.earn_permit

    expect(@facility_1.administer_written_test(@registrant_3)).to be false
    expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end

  # Road test

  it 'will not administer a road test if registrant is too young' do
    @facility_1.add_service('Written Test') 
    @facility_1.add_service('Road Test')

    expect(@facility_1.administer_road_test(@registrant_3)).to be false

    @registrant_3.earn_permit

    expect(@facility_1.administer_road_test(@registrant_3)).to be false
    expect(@registrant_3.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
  end   

  it 'will administer a road test if registrant has written test and is old enough' do
    @facility_1.add_service('Written Test') 
    @facility_1.administer_written_test(@registrant_1)
    
    expect(@facility_1.administer_road_test(@registrant_1)).to be false

    @facility_1.add_service('Road Test')
    
    expect(@facility_1.administer_road_test(@registrant_1)).to be true
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
  end

  # Renew license
  it 'renews a license' do
    @facility_1.add_service('Written Test') 
    @facility_1.add_service('Road Test')
    @facility_1.add_service('Renew License')
    @facility_1.administer_written_test(@registrant_1)
    @facility_1.administer_road_test(@registrant_1)
    @facility_1.administer_written_test(@registrant_2)
    @facility_1.administer_road_test(@registrant_2)
    @facility_1.administer_written_test(@registrant_3)
    @facility_1.administer_road_test(@registrant_3)


    expect(@facility_1.renew_drivers_license(@registrant_1)).to be true
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})

    @registrant_2.earn_permit
    expect(@facility_1.administer_written_test(@registrant_2)).to be true
    expect(@facility_1.administer_road_test(@registrant_2)). to be true
    expect(@facility_1.renew_drivers_license(@registrant_2)).to be true
    expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})

    @registrant_3.earn_permit
    expect(@facility_1.administer_written_test(@registrant_3)).to be false
    expect(@facility_1.administer_road_test(@registrant_3)). to be false
    expect(@facility_1.renew_drivers_license(@registrant_3)).to be false
    expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end
end