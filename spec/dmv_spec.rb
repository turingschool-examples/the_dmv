require 'spec_helper'
require 'date'

RSpec.describe Dmv do
  before(:each) do
    @dmv = Dmv.new
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @facility_3 = Facility.new({name: 'DMV Northwest Branch', address: '3698 W. 44th Avenue Denver CO 80211', phone: '(720) 865-4600'})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@dmv).to be_an_instance_of(Dmv)
      expect(@dmv.facilities).to eq([])
    end
  end

  describe '#add facilities' do
    it 'can add available facilities' do
      expect(@dmv.facilities).to eq([])
      @dmv.add_facility(@facility_1)
      expect(@dmv.facilities).to eq([@facility_1])
    end
  end

  describe '#facilities_offering_service' do
    it 'can return list of facilities offering a specified Service' do
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_2.add_service('New Drivers License')
      @facility_2.add_service('Road Test')
      @facility_2.add_service('Written Test')
      @facility_3.add_service('New Drivers License')
      @facility_3.add_service('Road Test')

      @dmv.add_facility(@facility_1)
      @dmv.add_facility(@facility_2)
      @dmv.add_facility(@facility_3)

      expect(@dmv.facilities_offering_service('Road Test')).to eq([@facility_2, @facility_3])
    end
  end

  describe "#register_vehicle" do
    it "Register vehicles and charge fees if Facility has Vehicle Registration service" do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

      @facility_1.add_service("Vehicle Registration")
      expect(cruz.registration_date).to eq(nil)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(cruz)
      expect(cruz.registration_date).to eq(Date.today)
      expect(cruz.plate_type).to eq(:regular)
      expect(@facility_1.registered_vehicles).to eq([cruz])
      expect(@facility_1.collected_fees).to eq(100)

      @facility_1.register_vehicle(camaro)
      expect(camaro.registration_date).to eq(Date.today)
      expect(camaro.plate_type).to eq(:antique)

      @facility_1.register_vehicle(bolt)
      expect(bolt.registration_date).to eq(Date.today)
      expect(bolt.plate_type).to eq(:ev)
      expect(@facility_1.registered_vehicles).to eq([cruz, camaro, bolt])
      expect(@facility_1.collected_fees).to eq(325)

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.register_vehicle(bolt)).to eq(nil)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)

    end
  end

  describe "Getting a drivers license" do
    describe "#Administer_written_test" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )

      it "sets :written to true if Facility has Written Test service, registrant has permit
      and registrant is 16 or older" do

        expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(registrant_1.permit?).to eq(true)

        @facility_1.administer_written_test(registrant_1)
        expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        @facility_1.add_service("Written Test")
        @facility_1.administer_written_test(registrant_1)
        expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

      end

      it "properly identifies if registrant doesn't have permit" do
        @facility_1.add_service("Written Test")

        expect(@facility_1.administer_written_test(registrant_2)).to eq(false)
        registrant_2.earn_permit
        expect(@facility_1.administer_written_test(registrant_2)).to eq(true)
        expect(registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it "properly identifies if registrant is under 16 years of age" do 
        @facility_1.add_service("Written Test")

        expect(@facility_1.administer_written_test(registrant_3)).to eq(false)
        registrant_3.earn_permit
        expect(@facility_1.administer_written_test(registrant_3)).to eq(false)
        expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end
    end
  end
end
