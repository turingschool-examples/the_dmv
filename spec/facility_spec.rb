require 'spec_helper'

RSpec.describe Facility do
 
  before(:each) do
    #Iteration1
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    #Iteration2-Vehicle Registration
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    #Iteration2-Getting a Drivers License
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16 )
    #Iteration2
    @registrant_3 = Registrant.new('Tucker', 15 )
  end
  
  it 'can initialize' do
    #Iteration1
    expect(@facility).to be_an_instance_of(Facility)
    expect(@facility.name).to eq('DMV Tremont Branch')
    expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
    expect(@facility.phone).to eq('(720) 865-4600')
    expect(@facility.services).to eq([])

    #Iteration2-Vehicle Registration
    expect(@facility_1).to be_an_instance_of(Facility)
    expect(@facility_1.name).to eq('DMV Tremont Branch')
    expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
    expect(@facility_1.phone).to eq('(720) 865-4600')
    expect(@facility_1.services).to eq([])
    expect(@facility_2).to be_an_instance_of(Facility)
    expect(@facility_2.name).to eq('DMV Northeast Branch')
    expect(@facility_2.address).to eq('4685 Peoria Street Suite 101 Denver CO 80239')
    expect(@facility_2.phone).to eq('(720) 865-4600')
    expect(@facility_2.services).to eq([])
  end
  
  #Iteration1
  it 'can add available services' do
    expect(@facility.services).to eq([])
    
    @facility.add_service('New Drivers License')
    @facility.add_service('Renew Drivers License')
    @facility.add_service('Vehicle Registration')
    
    expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
  end
  
  #Iteration2-Vehicle Registration
  it 'can register vehicles' do
    cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    
    @facility_1.add_service('Vehicle Registration')
    @facility_1.register_vehicle(cruz)

    expect(@facility_1.services).to eq(['Vehicle Registration'])
    expect(@facility_1.registered_vehicles).to eq([cruz])
    expect(@facility_1.register_vehicle(cruz)).to eq([cruz])    
  end
  
  #Iteration1 & Iteration2-Vehicle Registration
  it 'can be an empty/nil/0' do
    expect(@facility_1.registered_vehicles).to eq([])
    expect(@facility_1.collected_fees).to eq(0)
    
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    
    expect(@facility_2.registered_vehicles).to eq([])
    expect(@facility_2.register_vehicle(bolt)).to eq([])
    expect(@facility_2.registered_vehicles).to eq([])
    expect(@facility_2.services).to eq([])
    expect(@facility_2.collected_fees).to eq(0)
  end
  
  #Iteration1 & Iteration2-Vehicle Registration
  it 'can take in information' do
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
   
    @facility_1.add_service('Vehicle Registration')
    @facility_1.register_vehicle(cruz)

    expect(@facility_1.collected_fees).to eq(100)
    expect(@facility_1.register_vehicle(camaro)).to eq([cruz, camaro])    
    expect(@facility_1.register_vehicle(bolt)).to eq([cruz, camaro, bolt])    
    expect(@facility_1.collected_fees).to eq(325)
  end

  #Iteration2-Getting a Drivers License **Everything Below**
  it 'cannot administer test if not a service' do
    expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
  end

  it 'can add written test service' do
    @facility_1.add_service('Written Test')
    
    expect(@facility_1.services).to eq(['Written Test'])
  end
  
  it 'can administer written test' do
    @facility_1.add_service('Written Test')
    registrant_1 = Registrant.new('Bruce', 18, true)
    
    expect(@facility_1.administer_written_test(registrant_1)).to eq(true)
  end
  
  it 'cannot administer written test w/o permit' do
    registrant_2 = Registrant.new('Penny', 16 )
    
    expect(@facility_1.administer_written_test(registrant_2)).to eq(false)
    
    registrant_3 = Registrant.new('Tucker', 15 )
    
    expect(@facility_1.administer_written_test(registrant_3)).to eq(false)
  end
  
  it 'can administer written test after earning permit' do
    @facility_1.add_service('Written Test')
    registrant_2 = Registrant.new('Penny', 16 )
    registrant_2.earn_permit
    
    expect(@facility_1.administer_written_test(registrant_2)).to eq(true)
  end
  
  it 'can confirm that permits are not issued to registrants under 16' do
    registrant_3 = Registrant.new('Tucker', 15 )
    registrant_3.earn_permit

    expect(@facility_1.administer_written_test(registrant_3)).to eq(false)
    expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end
  
  it 'cannot administer a road test without a permit' do
    registrant_3 = Registrant.new('Tucker', 15 )

    expect(@facility_1.administer_road_test(registrant_3)).to eq(false)
    
    registrant_3.earn_permit
    
    expect(@facility_1.administer_road_test(registrant_3)).to eq(false)
  end
  
  it 'cannot administer a road test if the service is not provided' do
    expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)
  end
  
  it 'can administer a road test after service provided and written is passed' do
    @facility_1.add_service('Written Test')
    @facility_1.administer_written_test(@registrant_1)
    @facility_1.add_service('Road Test')

    expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    
    @registrant_2.earn_permit
    @facility_1.administer_written_test(@registrant_2)
    @facility_1.administer_road_test(@registrant_2)
    
    expect(@facility_1.administer_road_test(@registrant_2)).to eq(true)
    expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
  end
  
  it 'can renew a license after that service is added' do
    expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(false)
    
    @facility_1.add_service('Written Test') #I don't like that I need to fake add these services
    @facility_1.add_service('Road Test') #I don't like that I need to fake add these services, and readminister the 
    @facility_1.add_service('Renew License')
    @facility_1.administer_written_test(@registrant_1)
    @facility_1.administer_road_test(@registrant_1)
    
    expect(@facility_1.services).to eq(['Written Test', 'Road Test', 'Renew License'])
    expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)
    expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
  end
  
  it 'cannot do for minors' do
    registrant_3 = Registrant.new('Tucker', 15 )
    
    expect(@facility_1.renew_drivers_license(@registrant_3)).to eq(false)
    expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end
  
  it 'can renew' do
    @facility_1.add_service('Written Test')
    @facility_1.add_service('Road Test')
    @facility_1.add_service('Renew License')
    @registrant_2.earn_permit
    @facility_1.administer_written_test(@registrant_2) #I don't like that I need to fake administer this test to be able to renew
    @facility_1.administer_road_test(@registrant_2) #I don't like that I need to fake administer this test to be able to renew
    @facility_1.renew_drivers_license(@registrant_2)

    expect(@facility_1.renew_drivers_license(@registrant_2)).to eq(true)
    expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
  end
end
