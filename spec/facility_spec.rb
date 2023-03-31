require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @facility_1.add_service('Vehicle Registration')
    @facility_1.add_service('Written Test')
    @facility_1.add_service('Road Test')
    @facility_1.add_service('Renew License')
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
    @registrant_4 = Registrant.new('Fakeid', 14, true)
  end
  describe '#initialize' do
    it 'it exists and has attributes' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('Albany DMV Office')
      expect(@facility.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility.phone).to eq('541-967-2014')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      expect(@facility.add_service('Vehicle Registration')).to eq ('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#registered_vehicles' do 
    it 'returns an empty array by default' do 
      expect(@facility_1.registered_vehicles).to eq([])
    end
  end

  describe '#collected_fees' do 
    it 'returns an integer of total collected fees, default 0' do 
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#register_vehicle' do 
    it 'adds vehicle to registered vehicles' do 
      expect(@cruz.registration_date).to eq(nil)

      # return value is registered vehicles array
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'assigns a registration date' do 
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today)
    end

    it 'has a #collect_fees helper method' do 
      expect(@facility_1.collect_fees(@cruz)).to eq(100)
      expect(@facility_1.collect_fees(@bolt)).to eq(200)
      expect(@facility_1.collect_fees(@camaro)).to eq(25)
     
      # This method will add to total collected fees.
      expect(@facility_1.collected_fees).to eq(325)
    end

    it 'cannot register a vehicle once registered elsewhere' do 
      @facility_1.register_vehicle(@cruz)

      expect(@facility_2.register_vehicle(@cruz)).to be nil
      
      @facility_2.register_vehicle(@cruz)

      expect(@facility_2.registered_vehicles).to eq([])
      
    end

    it 'cannot register a vehicle until the service is added' do
      expect(@facility_2.services).to eq([])
      expect(@facility_2.register_vehicle(@bolt)).to be nil

      @facility_2.add_service('Vehicle Registration')

      expect(@facility_2.register_vehicle(@bolt)).to eq([@bolt])
      expect(@facility_2.registered_vehicles). to eq([@bolt])
    end

    it 'works with multiple vehices' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(325)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
    end
  end

  describe '#administer_written_test' do
    it 'returns true after service is added to facility' do
      expect(@facility_2.services).to eq([])

      expect(@facility_2.administer_written_test(@registrant_1)).to be false

      @facility_2.add_service('Written Test')

      expect(@facility_2.administer_written_test(@registrant_1)).to be true
    end

    it 'updates license data to :written => true' do
      @facility_1.administer_written_test(@registrant_1)

      expect(@registrant_1.license_data[:written]).to eq true
    end

    it 'cannot be administered if someone already did it' do 
      @facility_1.administer_written_test(@registrant_1)

      expect(@facility_1.administer_written_test(@registrant_1)).to be false
    end

    it 'cannot be administered if registrant does not have a permit' do
      expect(@registrant_2.permit?).to be false

      expect(@facility_1.administer_written_test(@registrant_2)).to be false
      expect(@registrant_2.license_data[:written]).to eq false
    end

    it 'cannot be administered if registrant is under 16' do
      expect(@registrant_4.age).to eq(14)
      expect(@facility_1.administer_written_test(@registrant_4)).to be false
      expect(@registrant_4.license_data[:written]).to be false
    end
  end
  
  describe '#administer_road_test' do 
    it 'returns true after service is added to facility' do 
      expect(@facility_2.services).to eq([])

      expect(@facility_2.administer_written_test(@registrant_1)).to be false

      @facility_2.add_service('Road Test')

      expect(@facility_2.administer_written_test(@registrant_1)).to be true
    end

    xit 'may only be administered if :written => true' do 
      expect(@facility_1.administer_road_test(@registrant_1)).to be false
      
      @facility_1.administer_written_test(@registrant_1)

      expect(@facility_1.administer_road_test(@registrant_1)).to be true
    end
      
    xit 'updates registrant license data to :license => true' do 
      @facility_1.administer_written_test(@registrant_1)

      expect(@registrant_1.license_data[:license]).to be false

      @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:license]).to be true
    end

    xit 'may only be administered if registrant is 16 or older' do
      @registrant_4.license_data[:written] = true

      expect(@facility_1.administer_road_test(@registrant_4)).to be false
      expect(@registrant_4.license_data[:license]).to be false
    end

    xit 'cannot be administered if someone has already done it' do 
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)

      expect(@facility_1.administer_road_test(@registrant_1)).to be false
    end
  end

  describe '#renew_drivers_license' do 
    it 'returns true after service is added to facility' do 

    end
     
    it 'may be executed if :written and :license => true' do 

    end
  end
end
