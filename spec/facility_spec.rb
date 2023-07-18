require 'spec_helper'

RSpec.describe Facility do
  before do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', 
      address: '2855 Tremont Place Suite 118 Denver CO 80205', 
      phone: '(720) 865-4600'
      })
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', 
      address: '4685 Peoria Street Suite 101 Denver CO 80239', 
      phone: '(720) 865-4600'
      })
    @cruz = Vehicle.new({vin: '123456789abcdefgh',
      year: 2012,
      make: 'Chevrolet',
      model: 'Cruz',
      engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh',
      year: 2019,
      make: 'Chevrolet',
      model: 'Bolt', 
      engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f',
      year: 1969,
      make: 'Chevrolet',
      model: 'Camaro',
      engine: :ice} )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_a(Facility)
      expect(@facility_2).to be_a(Facility)
    end
  end

  describe '#attributes' do
    it 'has readable attributes' do
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])

      expect(@facility_2.name).to eq('DMV Northeast Branch')
      expect(@facility_2.address).to eq('4685 Peoria Street Suite 101 Denver CO 80239')
      expect(@facility_2.phone).to eq('(720) 865-4600')
      expect(@facility_2.services).to eq([])
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

  describe '#vehicle_registration' do
    it 'can register vehicles' do
      @facility_1.add_service('Vehicle Registration')

      expect(@cruz.registration_date).to eq(nil)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.collected_fees).to eq(100)

      @facility_1.register_vehicle(@camaro)

      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)

      @facility_1.register_vehicle(@bolt)

      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.collected_fees).to eq(325)

      @facility_2.registered_vehicles
      @facility_2.services

      @facility_2.register_vehicle(@bolt)

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
      
    end
  end

  describe "#drivers_license" do
    it "can administer written test" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )

      facility_1 = Facility.new({name: 'DMV Tremont Branch',
        address: '2855 Tremont Place Suite 118 Denver CO 80205',
        phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch',
        address: '4685 Peoria Street Suite 101 Denver CO 80239',
        phone: '(720) 865-4600'})

      expect(registrant_1.license_data).to eq({:written=>false,
        :license=>false,:renewed=>false})
      expect(registrant_1.permit?).to eq(true)

      expect(facility_1.administer_written_test(registrant_1)).to eq(false)
      expect(registrant_1.license_data).to eq({:written=>false,
        :license=>false, :renewed=>false})

      facility_1.add_service('Written Test')

      expect(facility_1.administer_written_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true,
        :license=>false, :renewed=>false})

      expect(registrant_2.age).to eq(16)
      expect(registrant_2.permit?).to eq(false)
      
      expect(facility_1.administer_written_test(registrant_2)).to eq(false)

      registrant_2.earn_permit

      expect(facility_1.administer_written_test(registrant_2)).to eq(true)
      expect(registrant_2.license_data).to eq({:written=>true,
        :license=>false, :renewed=>false})

      expect(facility_1.administer_written_test(registrant_3)).to eq(false)

      registrant_3.earn_permit

      expect(facility_1.administer_written_test(registrant_3)).to eq(false)
      expect(registrant_3.license_data).to eq({:written=>false, 
        :license=>false, :renewed=>false})
    end
  end

  describe '#road_test' do
    it "can administer road test" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )

      facility_1 = Facility.new({name: 'DMV Tremont Branch',
        address: '2855 Tremont Place Suite 118 Denver CO 80205',
        phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch',
        address: '4685 Peoria Street Suite 101 Denver CO 80239',
        phone: '(720) 865-4600'})

      expect(facility_1.administer_road_test(registrant_3)).to eq(false)
      
      facility_1.add_service("Written Test")
      # facility_1.add_service("Road Test")
      # how do i get this to return an array with both services? 
      #why does this pass like this but without the line above uncommented??
      expect(facility_1.add_service("Road Test")).to eq(["Written Test", "Road Test"])

      facility_1.administer_written_test(registrant_1)
      facility_1.administer_road_test(registrant_1)

      expect(facility_1.administer_road_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, 
        :license=>true, :renewed=>false})
    end
  end

  describe '#renew_license' do
    it "can renew license" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )

      facility_1 = Facility.new({name: 'DMV Tremont Branch',
        address: '2855 Tremont Place Suite 118 Denver CO 80205',
        phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch',
        address: '4685 Peoria Street Suite 101 Denver CO 80239',
        phone: '(720) 865-4600'})

      facility_1.add_service("Written Test")
      facility_1.add_service("Road Test")
      facility_1.add_service("Renew License")
      facility_1.administer_written_test(registrant_1)
      facility_1.administer_road_test(registrant_1)
      facility_1.renew_drivers_license(registrant_1)

      expect(facility_1.renew_drivers_license(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, 
        :license=>true, :renewed=>true})
      
      facility_1.renew_drivers_license(registrant_3)

      expect(facility_1.renew_drivers_license(registrant_3)).to eq(false)
      
      registrant_2.earn_permit
      facility_1.administer_written_test(registrant_2)
      facility_1.administer_road_test(registrant_2)
      facility_1.renew_drivers_license(registrant_2)

      expect(registrant_2.license_data).to eq({:written=>true, 
        :license=>true, :renewed=>true})
    end
  end
end
