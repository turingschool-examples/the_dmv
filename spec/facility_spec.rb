require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600', hours: 'Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.hours).to eq("Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.")
      expect(@facility.services).to eq([])
    end

    it 'can also display holidays if given' do
      facility = Facility.new({name: 'Oakville', address: '3164 TELEGRAPH ROAD ST LOUIS MO 63125', phone: '(314) 887-1050', hours: 'Monday-Friday - 9:00 to 5:00, Last Saturday  - 9:00 to 12:00', holidays: "Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), President’s Day (02/20/23), Memorial Day (05/29/23), Juneteenth (06/19/2023), Independence Day (07/04/23), Labor Day (09/04/23), Veterans Day (11/10/23),Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)"})
      expect(@facility.holidays).to eq(nil)
      expect(facility.holidays).to eq("Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), President’s Day (02/20/23), Memorial Day (05/29/23), Juneteenth (06/19/2023), Independence Day (07/04/23), Labor Day (09/04/23), Veterans Day (11/10/23),Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)")
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
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    end

    it 'can register vehicles if service is offered' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles.count).to eq(1)
      expect(@facility_1.registered_vehicles[0]).to be_an_instance_of(Vehicle)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.registered_vehicles.count).to eq(3)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end

    it 'will not register vehicle if service is not offered' do
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.register_vehicle(@cruz)).to be false
      expect(@facility_1.registered_vehicles.count).to eq(0)
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles.count).to eq(1)
    end

    it ' will not register vehicle if vehicle is already registered' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
      expect(@facility_1.registered_vehicles.count).to eq(1)
      expect(@facility_1.register_vehicle(@cruz)).to be false
      expect(@facility_1.collected_fees).to eq(100)
      expect(@facility_1.registered_vehicles.count).to eq(1)
    end

    it 'can collect fees' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.collected_fees).to eq(0)
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq(125)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end

    it 'can assign plate types' do
      @facility_1.add_service('Vehicle Registration')
      expect(@cruz.plate_type).to eq(nil)
      expect(@camaro.plate_type).to eq(nil)
      expect(@bolt.plate_type).to eq(nil)
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.plate_type).to eq(:regular)
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.plate_type).to eq(:antique)
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'can assign registration date' do
      @facility_1.add_service('Vehicle Registration')
      expect(@cruz.registration_date).to eq(nil)
      expect(@camaro.registration_date).to eq(nil)
      expect(@bolt.registration_date).to eq(nil)
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to be_an_instance_of(Date)
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.registration_date).to be_an_instance_of(Date)
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to be_an_instance_of(Date)
    end
  end

  describe 'Earning full license' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 16 )
      @registrant_3 = Registrant.new('Tucker', 15 )
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    end
    describe '#administer_written_test' do
      it 'will not administer test if service is not offerered' do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_1.permit?).to be true
        expect(@facility_1.administer_written_test(@registrant_1)).to be false
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it 'will administer test if service is offered' do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        @facility_1.add_service('Written Test')
        expect(@facility_1.administer_written_test(@registrant_1)).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it 'will not administer test if registrant has no permit' do
        expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_2.age).to eq(16)
        expect(@registrant_2.permit?).to eq(false)
        @facility_1.add_service('Written Test')
        expect(@facility_1.administer_written_test(@registrant_2)).to be false
        expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        @registrant_2.earn_permit
        expect(@facility_1.administer_written_test(@registrant_2)).to be true
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it 'will not administer test if registrant is less than 16 years old' do
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_3.age).to eq(15)
        expect(@registrant_3.permit?).to eq(false)
        @facility_1.add_service('Written Test')
        expect(@facility_1.administer_written_test(@registrant_3)).to be false
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        @registrant_3.earn_permit
        expect(@facility_1.administer_written_test(@registrant_3)).to be false
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

    end

    describe '#administer_road_test' do
      it 'cannot administer road test if service is not offered' do
        @facility_1.add_service('Written Test')
        @facility_1.administer_written_test(@registrant_1)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
        expect(@registrant_1.permit?).to be true
        expect(@facility_1.administer_road_test(@registrant_1)).to be false
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it 'can administer road test if service is offered' do
        @facility_1.add_service('Written Test')
        @facility_1.administer_written_test(@registrant_1)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
        expect(@registrant_1.permit?).to be true
        @facility_1.add_service('Road Test')
        expect(@facility_1.administer_road_test(@registrant_1)).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end

      it 'will not administer a road test if written test has not been taken' do
        @facility_1.add_service('Written Test')
        @facility_1.add_service('Road Test')
        @registrant_2.earn_permit
        expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_2.permit?).to be true
        expect(@facility_1.administer_road_test(@registrant_2)).to be false
        expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        @facility_1.administer_written_test(@registrant_2)
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
        expect(@facility_1.administer_road_test(@registrant_2)).to be true
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end
    end

    describe '#renew_drivers_license' do
      it 'cannot renew license if service is not offered' do
        @facility_1.add_service('Written Test')        
        @facility_1.add_service('Road Test')
        @facility_1.administer_written_test(@registrant_1)
        @facility_1.administer_road_test(@registrant_1)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
        expect(@facility_1.renew_drivers_license(@registrant_1)).to be false
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end

      it 'can renew license if service is offered' do
        @facility_1.add_service('Written Test')        
        @facility_1.add_service('Road Test')
        @facility_1.add_service('Renew License')
        @facility_1.administer_written_test(@registrant_1)
        @facility_1.administer_road_test(@registrant_1)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
        expect(@facility_1.renew_drivers_license(@registrant_1)).to be true
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      end

      it 'cannot renew license without a drivers license' do
        @facility_1.add_service('Written Test')        
        @facility_1.add_service('Road Test')
        @facility_1.add_service('Renew License')
        @registrant_2.earn_permit
        expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_2.permit?).to be true
        expect(@facility_1.renew_drivers_license(@registrant_2)).to be false
        expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        @facility_1.administer_written_test(@registrant_2)
        expect(@facility_1.renew_drivers_license(@registrant_2)).to be false
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
        @facility_1.administer_road_test(@registrant_2)
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
        expect(@facility_1.renew_drivers_license(@registrant_2)).to be true
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      end
    end
  end
end
