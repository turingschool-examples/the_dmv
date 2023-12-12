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

  describe 'vehicle registration' do
    it 'can add a registration' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      expect(facility_1.add_service('Vehicle Registration')).to eq(facility_1.services)
      expect(facility_1.registered_vehicles).to eq([])
      expect(facility_1.collected_fees).to eq(0)
    
      expect(facility_1.register_vehicle(cruz)).to eq([cruz])
      expect(cruz.registration_date).to eq(Date.today)
      expect(cruz.plate_type).to eq(:regular)
      expect(facility_1.registered_vehicles).to eq([cruz])
      expect(facility_1.collected_fees).to eq(100)

      expect(facility_1.register_vehicle(camaro)).to eq([cruz, camaro])
      expect(camaro.registration_date).to eq(Date.today)
      expect(camaro.plate_type).to eq(:antique)

      expect(facility_1.register_vehicle(bolt)).to eq([cruz, camaro, bolt])
      expect(bolt.registration_date).to eq(Date.today)
      expect(bolt.plate_type).to eq(:ev)

      expect(facility_1.registered_vehicles).to eq([cruz, camaro, bolt])
      expect(facility_1.collected_fees).to eq(325)
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.services).to eq([])
      expect(facility_2.register_vehicle(bolt)).to eq(nil)
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.collected_fees).to eq(0)
    end
  end

  describe 'driver license' do
    it 'can have a driver license' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_1.permit?).to eq(true)
      expect(facility_1.administer_written_test(registrant_1)).to eq(false)
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(facility_1.add_service('Written Test')).to eq(["Written Test"])
      expect(facility_1.administer_written_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      expect(registrant_2.age).to eq(16)
      expect(registrant_2.permit?).to eq(false)
      expect(facility_1.administer_written_test(registrant_2)).to eq(false)

      registrant_2.earn_permit
      expect(facility_1.administer_written_test(registrant_2)).to eq(true)
      expect(registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      expect(registrant_3.age).to eq(15)
      expect(registrant_3.permit?).to eq(false)
      expect(facility_1.administer_written_test(registrant_3)).to eq(false)

      registrant_3.earn_permit
      expect(facility_1.administer_written_test(registrant_3)).to eq(false)
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'can have a road test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

      registrant_1.license_data
      registrant_1.permit?
      facility_1.administer_written_test(registrant_1)
      registrant_1.license_data
      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)
      registrant_1.license_data
      registrant_2.age
      registrant_2.permit?
      facility_1.administer_written_test(registrant_2)

      registrant_2.earn_permit
      facility_1.administer_written_test(registrant_2)
      registrant_2.license_data
      registrant_3.age
      registrant_3.permit?
      facility_1.administer_written_test(registrant_3)

      registrant_3.earn_permit
      facility_1.administer_written_test(registrant_3)
      registrant_3.license_data

      expect(facility_1.administer_road_test(registrant_3)).to eq(false)
      registrant_3.earn_permit
      expect(facility_1.administer_road_test(registrant_3)).to eq(false)
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(facility_1.administer_road_test(registrant_1)).to eq(false)
      expect(facility_1.add_service('Road Test')).to eq(["Written Test", "Road Test"])
      expect(facility_1.administer_road_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      expect(facility_1.administer_road_test(registrant_2)).to eq(true)
      expect(registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end

    it 'can renew license' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

      registrant_1.license_data
      registrant_1.permit?
      facility_1.administer_written_test(registrant_1)
      registrant_1.license_data
      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)
      registrant_1.license_data
      registrant_2.age
      registrant_2.permit?
      facility_1.administer_written_test(registrant_2)

      registrant_2.earn_permit
      facility_1.administer_written_test(registrant_2)
      registrant_2.license_data
      registrant_3.age
      registrant_3.permit?
      facility_1.administer_written_test(registrant_3)

      registrant_3.earn_permit
      facility_1.administer_written_test(registrant_3)
      registrant_3.license_data

      facility_1.administer_road_test(registrant_3)
      registrant_3.earn_permit
      facility_1.administer_road_test(registrant_3)
      registrant_3.license_data
      facility_1.administer_road_test(registrant_1)
      facility_1.add_service('Road Test')
      facility_1.administer_road_test(registrant_1)
      registrant_1.license_data
      facility_1.administer_road_test(registrant_2)
      registrant_2.license_data

      expect(facility_1.renew_drivers_license(registrant_1)).to eq(false)
      expect(facility_1.add_service('Renew License')).to eq(["Written Test", "Road Test", "Renew License"])
      expect(facility_1.renew_drivers_license(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      expect(facility_1.renew_drivers_license(registrant_3)).to eq(false)
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(facility_1.renew_drivers_license(registrant_2)).to eq(true)
      expect(registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end
  end
end

describe 'helper methods' do
  describe 'register vehicle helper' do
    it 'should register antique car' do
      facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      car = Vehicle.new({
        :vin=> "2626277376262",
        :year=> 1969,
        :make=> "Tesla",
        :model=> "model S",
        :engine=> "ev"
      })
      facility.add_service("New car")
      facility.register_vehicle_helper(car)

      expect(facility.collected_fees).to eq(25)
      expect(car.plate_type).to eq(:antique)
    end

    it 'should register electric vehicles' do
      facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      car = Vehicle.new({
        :vin=> "62737373",
        :year=> 2019,
        :make=> "Toyota",
        :model=> "Corolla",
        :engine=> :ev
      })
      facility.add_service("New car")
      facility.register_vehicle_helper(car)

      expect(facility.collected_fees).to eq(200)
      expect(car.plate_type).to eq(:ev)
    end 

    it 'should register regular vehicles' do 
      facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      car = Vehicle.new({
        :vin=> "82772837",
        :year=> 2018,
        :make=> "Hyundai",
        :model=> "Elantra",
        :engine=> :regular
      })
      facility.add_service("New car")
      facility.register_vehicle_helper(car)

      expect(facility.collected_fees).to eq(100)
      expect(car.plate_type).to eq(:regular)
    end 

    it 'should set registration date' do
      facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      car = Vehicle.new({
        :vin=> "82772837",
        :year=> 2018,
        :make=> "Hyundai",
        :model=> "Elantra",
        :engine=> :regular
      })
      facility.add_service("New car")
      facility.set_registration_date(car)

      expect(car.registration_date).to eq(Date.today)
    end 
  end

  describe 'written test helper' do
    it 'should have a written test' do
      facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      registrant = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Carlos', 15)

      facility.written_test_helper(registrant)
      facility.written_test_helper(registrant_2)

      expect(registrant.license_data[:written]).to eq true
      expect(registrant_2.license_data[:written]).to eq false
    end
  end

  describe 'road test helper' do 
    it 'should have a road test' do
      facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      registrant = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Carlos', 15)
      registrant.license_data[:written] = true
     
      facility.road_test_helper(registrant)
      facility.road_test_helper(registrant_2)

      expect(registrant.license_data[:license]).to eq true
      expect(registrant_2.license_data[:license]).to eq false
    end
  end 
end

