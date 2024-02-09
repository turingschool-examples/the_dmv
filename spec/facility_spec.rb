require 'spec_helper.rb'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Facility do

    before(:each) do
        @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})

        @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
        @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
        @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    end

    describe '# initialize' do

        it 'can initialize' do
            expect(@facility).to be_an_instance_of(Facility)
            expect(@facility.name).to eq('DMV Tremont Branch')
            expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
            expect(@facility.phone).to eq('(720) 865-4600')
            expect(@facility.services).to eq([])
            expect(@facility.registered_vehicles).to eq([])
            expect(@facility.collected_fees).to eq(0)
        end

    end

    describe '# add service' do

        it 'can add available services' do
            expect(@facility.services).to eq([])
            @facility.add_service('New Drivers License')
            @facility.add_service('Renew Drivers License')
            @facility.add_service('Vehicle Registration')
            expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
        end

    end

    describe '# registers vehicle' do

        it 'will not register vehicle if does not have service' do
            expect(@facility.registered_vehicles).to eq([])
            @facility.register_vehicle(@cruz)
            expect(@facility.registered_vehicles).to eq([])
        end

        it 'will register vehicle does include service' do
            expect(@facility.registered_vehicles).to eq([])
            @facility.add_service('Vehicle Registration')
            @facility.register_vehicle(@cruz)
            expect(@facility.registered_vehicles).to eq([@cruz])
        end

        # it 'updates registration date' do
        #     expect(@facility.registered_vehicles).to eq([])
        #     @facility.add_service('Vehicle Registration')
        #     @facility.register_vehicle(@cruz)
        #     expect(@facility.registered_vehicles).to eq([@cruz])
        # end

        describe '# updates plate type' do

            it 'updates plate type (antique)' do
                expect(@camaro.plate_type).to eq(nil)
                @facility.add_service('Vehicle Registration')
                @facility.register_vehicle(@camaro)
                expect(@camaro.plate_type).to eq(:antique)
            end

            it 'updates plate type (ev)' do
                expect(@bolt.plate_type).to eq(nil)
                @facility.add_service('Vehicle Registration')
                @facility.register_vehicle(@bolt)
                expect(@bolt.plate_type).to eq(:ev)
            end

            it 'updates plate type (regular)' do
                expect(@cruz.plate_type).to eq(nil)
                @facility.add_service('Vehicle Registration')
                @facility.register_vehicle(@cruz)
                expect(@cruz.plate_type).to eq(:regular)
            end

        end

        describe '# collects fees' do

            it 'collects fees (antique)' do
                expect(@camaro.plate_type).to eq(nil)
                @facility.add_service('Vehicle Registration')
                @facility.register_vehicle(@camaro)
                expect(@facility.collected_fees).to eq(25)
            end

            it 'collects fees (ev)' do
                expect(@bolt.plate_type).to eq(nil)
                @facility.add_service('Vehicle Registration')
                @facility.register_vehicle(@bolt)
                expect(@facility.collected_fees).to eq(200)
            end

            it 'collects  fees (regular)' do
                expect(@cruz.plate_type).to eq(nil)
                @facility.add_service('Vehicle Registration')
                @facility.register_vehicle(@cruz)
                expect(@facility.collected_fees).to eq(100)
            end

        end

    end

end
