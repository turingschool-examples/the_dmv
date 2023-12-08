require 'spec_helper'
require 'pry'

RSpec.describe Facility do
  before(:each) do
        @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})

        @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

        @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

        @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )

        @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  
  describe '#objects' do
        it 'is an object of the class' do
        expect(@facility_1).to be_an_instance_of(Facility)
        expect(@cruz).to be_an_instance_of (Vehicle)
        end

        it 'can add a service' do
            @facility_1.add_service('Vehicle Registration')
            expect(@facility_1.services).to eq (["Vehicle Registration"])
        end

        it 'doesnt have a registration date' do
            expect(@cruz.registration_date).to eq(nil)
        end
    end

    describe '#registered_vehicles' do
        it 'has registered vehicles' do
            expect(@facility_1.registered_vehicles).to eq ([])
        end
    end

    describe '#register_vehicle' do
        it 'registers a vehicle' do

            expect(@facility_1.register_vehicle(@cruz)).to eq ([@cruz])
        end
    end

    describe '#collected_fees' do
        it 'stores collected fees' do
            expect(@facility_1.collected_fees).to eq(0)
        end
    end

    # describe '#registration_date' do
    # # Need to make registration date not equal nil
    #     it 'has a registration date' do
    #         expect(@cruz.registration_date).to be_a (Date)
    #     end
    # end
end