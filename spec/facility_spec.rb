require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
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
      expect(@facility_1.registered_vehicles).to eq([])
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

  describe '#register_vehicle(vehicle)' do 
    it 'has no registered vehicles' do 
      expect(@facility_1.registered_vehicles).to eq([])
    end 
    
    it 'facility provides the service needed' do 
      expect(@facility_1.services).to eq([])

      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.services).to eq(['Vehicle Registration'])
    end 

    it 'does not provide service if the facility does not offer it' do
      expect(@facility_1.services).to eq([])

      @facility_1.add_service('Vehicle Registration')

      expect(@facility_2.services).to eq([])
    end 

    it 'can tell if a vehicle was registered' do 
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(cruz)

      expect(@facility_1.registered_vehicles).to eq([cruz])
    end 
  
    it 'can give a date a vehicle is registered' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

            
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(cruz)

      expect(@facility_1.registered_vehicles.first.registration_date).to eq(Date.today)
    end
  end 
  
  describe '#create_plate' do 
    it 'can give a plate type :regular' do 
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      @facility_1.create_plate(cruz)

      expect(cruz.plate_type).to eq(:regular)
    end 

    it 'can give a plate type :ev' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )

      @facility_1.create_plate(bolt) 
      
      expect(bolt.plate_type).to eq(:ev)
    end 
  end 

  describe '#collected_fees' do 
    it 'starts with 0 collected fees' do 
      expect(@facility_1.collected_fees).to eq(0)
    end 

    it 'collects 100 for regular cars' do 
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      
            
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(cruz) 

      expect(@facility_1.collected_fees).to eq(100)
    end 

    it 'collects 200 for ev cars' do 
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      
            
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(bolt) 

      expect(@facility_1.collected_fees).to eq(200)
    end 
  end 

  describe '#register_fee(vehicle)' do 
    it 'collects 100 when registering car with :regular plates' do 
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      
      @facility_1.create_plate(cruz)
      @facility_1.register_fee(cruz)

      expect(@facility_1.collected_fees).to eq(100)
    end 

    it 'collects 200 when registering car with :ev plates' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )

      @facility_1.create_plate(bolt)
      @facility_1.register_fee(bolt)

      expect(@facility_1.collected_fees).to eq(200)
    end 
  end 

  describe '#administer_written_test(person)' do 
    it 'does not administer a written if service is not provided' do 
      expect(@facility_1.services).to eq([])

      registrant_1 = Registrant.new('Bruce', 18, true )

      @facility_1.administer_written_test(registrant_1)

      expect(@facility_1.administer_written_test(registrant_1)).to eq(false)
    end
    
    it 'administers a written test if service is provided' do 
      expect(@facility_1.services).to eq([])

      @facility_1.add_service('Written Test')

      expect(@facility_1.services).to eq(['Written Test'])

      registrant_1 = Registrant.new('Bruce', 18, true )
      @facility_1.administer_written_test(registrant_1)

      expect(@facility_1.administer_written_test(registrant_1)).to eq(true)
    end 

    it 'does not administer test if person does not have a permit' do 
      expect(@facility_1.services).to eq([])

      @facility_1.add_service('Written Test')
      expect(@facility_1.services).to eq(['Written Test'])
      
      registrant_2 = Registrant.new('Penny', 16 )
      @facility_1.administer_written_test(registrant_2)

      expect(@facility_1.administer_written_test(registrant_2)).to eq(false)
    end 

    it 'does not administer test if person is not old enough' do 
      @facility_1.add_service('Written Test')
      expect(@facility_1.services).to eq(['Written Test'])

      registrant_3 = Registrant.new('Tucker', 15 )
      @facility_1.administer_written_test(registrant_3)

      expect(@facility_1.administer_written_test(registrant_3)).to eq(false)

      registrant_3.earn_permit 

      expect(@facility_1.administer_written_test(registrant_3)).to eq(false)
    end 

    it 'will administer test after a permit is earned' do 
      expect(@facility_1.services).to eq([])

      @facility_1.add_service('Written Test')
      expect(@facility_1.services).to eq(['Written Test'])
      
      registrant_2 = Registrant.new('Penny', 16 )
      @facility_1.administer_written_test(registrant_2)

      expect(@facility_1.administer_written_test(registrant_2)).to eq(false)

      registrant_2.earn_permit 

      expect(@facility_1.administer_written_test(registrant_2)).to eq(true)
    end 
  end 

  describe '#administer_road_test(registrant)' do 
    it 'will only provide road test if service is provided and written test is true' do
      @facility_1.add_service('Written Test')
      expect(@facility_1.services).to eq(['Written Test'])

      registrant_1 = Registrant.new('Bruce', 18, true )
      
      @facility_1.administer_road_test(registrant_1)

      expect(@facility_1.administer_road_test(registrant_1)).to eq(false)

      @facility_1.add_service('Road Test')
      expect(@facility_1.administer_road_test(registrant_1)).to eq(false)
      
      @facility_1.administer_written_test(registrant_1)
      @facility_1.administer_road_test(registrant_1)

      expect(@facility_1.administer_road_test(registrant_1)).to eq(true)
    end 
  
    it 'will not administer road test if person did not pass written test' do 
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Written Test')
      expect(@facility_1.services).to eq(['Road Test', 'Written Test'])

      registrant_3 = Registrant.new('Tucker', 15 )
      expect(@facility_1.administer_road_test(registrant_3)).to eq(false)

      @facility_1.administer_written_test(registrant_3)

      expect(@facility_1.administer_road_test(registrant_3)).to eq(false)
    end 
  end 

  describe '#renew_drivers_license' do 
    it 'has service to renew license' do 
      expect(@facility_1.services).to eq([])

      @facility_1.add_service('Renew License')

      expect(@facility_1.services).to eq(['Renew License'])
    end 

    it 'will renew license if registrant has a license' do
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Renew License')
      registrant_1 = Registrant.new('Bruce', 18, true )
      @facility_1.administer_written_test(registrant_1)
      @facility_1.administer_road_test(registrant_1)

      expect(@facility_1.renew_drivers_license(registrant_1)).to eq(true)
    end 

    it 'will not renew license if registrant has no license' do 
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Renew License')
      registrant_3 = Registrant.new('Tucker', 15 )

      expect(@facility_1.renew_drivers_license(registrant_3)).to eq(false)

      @facility_1.administer_written_test(registrant_3)

      expect(@facility_1.administer_written_test(registrant_3)).to eq(false)
      
      @facility_1.administer_road_test(registrant_3)

      expect(@facility_1.administer_road_test(registrant_3)).to eq(false)
      expect(@facility_1.renew_drivers_license(registrant_3)).to eq(false)
    end 
  end  
end
