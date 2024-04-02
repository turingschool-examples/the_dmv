require 'spec_helper.rb'

RSpec.describe Facility do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])

      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  # Write a test to show vehicles get registered via #register_vehicle method.
  # Show before/after status with faciilty_1.registered_vehicles changing to 
  #  store vehicles as they are processed.
  # 
  describe '#register_vehicle' do
    it 'shows array of registered vehicles' do
      
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])

      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.registered_vehicles).to eq([])

      @facility_2.collected_fees
      expect(@facility_2.collected_fees).to eq(0)

    end

    it 'added $25 to @collected_fees for antique vehicle' do
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.collected_fees).to eq(25)

    end

    it 'added $200 to @collected_fees for EVs' do
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(200)
    end

    it 'added $100 to @collected_fees for any vehicle not antique/not EV' do
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'assigns plate type to the vehicle' do
      expect(@cruz.plate_type).to eq(nil)
      expect(@camaro.plate_type).to eq(nil)
      expect(@bolt.plate_type).to eq(nil)

      @facility_1.add_service('Vehicle Registration') # We're adding the service so we can register the vehicle

      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@cruz.plate_type).to eq(:regular)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'applies a timestamp' do

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@cruz.registration_date).to eq(Date.today)
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@bolt.registration_date).to eq(Date.today)

    end
  end

  describe '#administer_written_test' do
    it 'cannot administer before adding services' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false}) # before
      expect(@registrant_1.permit?).to be(true) # registrant_1 has permit, but that doesn't change test or license status in hash
      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_written_test(@registrant_1)).to be(false)
      expect(@registrant_1.license_data).to eq({:written => false, :license => false, :renewed => false}) # after - shows having permit does not change values in this hash
    end
      
    it 'can administer written test to registrants with permit and over 16 years of age' do

      @facility_1.add_service('Written Test')
      expect(@facility_1.services).to eq(['Written Test']) # "Written Test" is showing twice in my services array

      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_written_test(@registrant_1)).to be(true)
      expect(@registrant_1.license_data).to eq({:written => true, :license => false, :renewed => false})
    end

  

    it 'can now administer written test to registrant_2' do
      
      @facility_1.add_service('Written Test')

      @registrant_2.age
      expect(@registrant_2.age).to eq(16)
      
      @registrant_2.permit?
      expect( @registrant_2.permit?).to be(false)
      
      @facility_1.administer_written_test(@registrant_2)
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)

      @registrant_2.earn_permit
      expect(@facility_1.administer_written_test(@registrant_2)).to be(true)

      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      
      @registrant_3.age
      expect(@registrant_3.age).to eq(15)
      
      @registrant_3.permit?
      expect(@registrant_3.permit?).to be(false)
      
      @facility_1.administer_written_test(@registrant_3)
      expect(@facility_1.administer_written_test(@registrant_3)).to be(false)
      
      @registrant_3.earn_permit
      expect(@registrant_3.earn_permit).to be(true)
      
      @facility_1.administer_written_test(@registrant_3)
      expect(@facility_1.administer_written_test(@registrant_3)).to be(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end


  it 'administers a road test' do
    
    @facility_1.administer_road_test(@registrant_3)
    expect(@facility_1.administer_road_test(@registrant_3)).to be(false)
    
    @registrant_3.earn_permit
  
    @facility_1.administer_road_test(@registrant_3)
    expect(@facility_1.administer_road_test(@registrant_3)).to be(false)
    
    @registrant_3.license_data
    expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    
    @facility_1.administer_road_test(@registrant_1)
    expect(@facility_1.administer_road_test(@registrant_1)).to be(false)
    
    @facility_1.add_service("Written Test")

    expect(@facility_1.add_service("Road Test")).to eq(["Written Test", "Road Test"])
    
    @facility_1.administer_written_test(@registrant_1)
    @facility_1.administer_road_test(@registrant_1)
    expect(@facility_1.administer_road_test(@registrant_1)).to be(true)
    
    @registrant_1.license_data
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    
    @facility_1.administer_road_test(@registrant_2)
    expect(@facility_1.administer_road_test(@registrant_2)).to be(true)
    
    @registrant_2.earn_permit
    @facility_1.administer_written_test(@registrant_2)
    @registrant_2.license_data
    expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    
    # Renew License
    
    @facility_1.renew_drivers_license(@registrant_1)
    expect(@facility_1.renew_drivers_license(@registrant_1)).to be(false)
    
    @facility_1.add_service('Renew License')
    expect(@facility_1.add_service('Renew License')).to eq(["Written Test", "Road Test", "Renew License"])
    
    @facility_1.renew_drivers_license(@registrant_1)
    expect(@facility_1.renew_drivers_license(@registrant_1)).to be(true)
    
    @registrant_1.license_data
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    
    @facility_1.renew_drivers_license(@registrant_3)
    expect(@facility_1.renew_drivers_license(@registrant_3)).to be(false)
    
    @registrant_3.license_data
    expect(@registrant_3.license_data.to eq({:written=>false, :license=>false, :renewed=>false}))
    
    @facility_1.renew_drivers_license(@registrant_2)
    expect(@facility_1.renew_drivers_license(@registrant_2)).to be(true)
    
    @registrant_2.license_data 
    expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
  end
end

