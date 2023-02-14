require 'rspec'
require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
  end

  let(:facility_1) {Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })}
  let(:facility_2) {Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })}

  let(:cruz) {Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )}
  let(:camaro) {Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )}
  let(:bolt) {Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )}
 
  let(:registrant_1) {Registrant.new('Bruce', 18, true )}
  let(:registrant_2) {Registrant.new('Penny', 16 )}
  let(:registrant_3) {Registrant.new('Tucker', 15 )}

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
  
  describe '#register a vehicle' do
    it 'vehicles start with a nil regisrtation date' do
      expect(cruz.registration_date).to be nil 
    end
    
    it 'DMVs start with an empty array of registered vehicles' do
      expect(@facility.registered_vehicles).to eq([])
    end
    
    it 'DMVs can collect fees on registered cars' do
      expect(facility_1.collected_fees).to eq(0)
    end
    
    it 'DMVs can register a vehicle' do
      
      expect(facility_1.register_vehicle(cruz)).to eq([cruz])
    end
    
    it 'Registered vehicles have a registration date' do
      facility_1.register_vehicle(cruz)
      expect(cruz.registration_date).to eq(Date.today)
    end
    
    it 'cars have different plate types' do
      facility_1.register_vehicle(cruz)
      facility_1.register_vehicle(camaro)
      
      
      expect(cruz.plate_type).to eq(:regular)
      expect(camaro.plate_type).to eq(:antique)
    end
    
    it 'DMV carries an array of registerd vehicles' do
      facility_1.register_vehicle(cruz)
      facility_1.register_vehicle(camaro)
      
      expect(facility_1.registered_vehicles).to eq([cruz, camaro])
    end
    
    it 'DMVs can collect fees from registered cars' do
      facility_1.register_vehicle(cruz)
      facility_1.register_vehicle(camaro)
      
      expect(facility_1.collected_fees).to eq(125)
    end 
  end
  
  describe '#drivers liscense' do 
    it 'facility can administer the written test' do
      expect(registrant_1.license_data[:written]).to be false

      expect(facility_1.administer_written_test(registrant_1)).to be false

      expect(facility_1.add_service('Written Test')).to eq(["Written Test"])

      expect(facility_1.administer_written_test(registrant_1)).to be true

      expect(registrant_1.license_data[:written]).to be true
    end

    it 'registrant 2 can take the written test' do
      expect(registrant_2.age).to eq(16)

      expect(registrant_2.permit?).to be false


      expect(facility_1.administer_written_test(registrant_2)).to be false

      registrant_2.earn_permit
      facility_1.add_service('Written Test')

      expect(facility_1.administer_written_test(registrant_2)).to be true

      expect(registrant_2.license_data[:written]).to be true
    end

    it 'a registrant without a permit can not take written test' do
      expect(registrant_3.age).to eq(15)

      expect(registrant_3.permit?).to be false

      facility_1.add_service('Written Test')

      expect(facility_1.administer_written_test(registrant_3)).to be false

      registrant_3.earn_permit

      expect(facility_1.administer_written_test(registrant_3)).to be false

      expect(registrant_3.license_data[:written]).to be false
    end 
  end

  describe '#road tests' do
    it 'a registrant without a permit can not take the road test' do
      expect(facility_1.administer_road_test(registrant_3)).to be false

      registrant_3.earn_permit

      expect(facility_1.administer_road_test(registrant_3)).to be false
      expect(registrant_3.license_data[:license]).to be false
    end

    it 'a registrant with a who has passed the written test can take the road test' do
      expect(facility_1.administer_road_test(registrant_1)).to be false

      facility_1.add_service('Written Test')
      expect(facility_1.administer_written_test(registrant_1)).to be true
      registrant_2.earn_permit
      expect(facility_1.administer_written_test(registrant_2)).to be true

      expect(facility_1.add_service('Road Test')).to eq(["Written Test", "Road Test"])
      expect(facility_1.administer_road_test(registrant_1)).to be true
      expect(facility_1.administer_road_test(registrant_2)).to be true
      expect(registrant_1.license_data[:license]).to be true
      expect(registrant_2.license_data[:license]).to be true

    end
  end

  describe '#renew drivers liscense' do
    before do 
      facility_1.add_service('Written Test')
      facility_1.add_service('Road Test')
      registrant_2.earn_permit
      facility_1.administer_written_test(registrant_1)
      facility_1.administer_written_test(registrant_2)
      facility_1.administer_road_test(registrant_1)
      facility_1.administer_road_test(registrant_2)
    end
    it 'a registrant can renew drivers liscense' do
      expect(facility_1.renew_drivers_license(registrant_1)).to be false
      expect(facility_1.renew_drivers_license(registrant_2)).to be false
      
      facility_1.add_service('Renew License')

      expect(facility_1.renew_drivers_license(registrant_1)).to be true
      expect(facility_1.renew_drivers_license(registrant_2)).to be true
      expect(registrant_1.license_data[:renewed]).to be true
      expect(registrant_2.license_data[:renewed]).to be true
    end

    it 'A registrant without a permit can not renew license' do
      expect(facility_1.renew_drivers_license(registrant_3)).to be false
      expect(registrant_3.license_data[:renewed]).to be false
    end



  end







end 