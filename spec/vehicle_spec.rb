require 'spec_helper.rb'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Vehicle do

    before(:each) do
        @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})

        @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
        @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
        @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    end

    describe '# initialize' do

        it 'can initialize' do
            expect(@cruz).to be_an_instance_of(Vehicle)
            expect(@cruz.vin).to eq('123456789abcdefgh')
            expect(@cruz.year).to eq(2012)
            expect(@cruz.make).to eq('Chevrolet')
            expect(@cruz.model).to eq('Cruz')
            expect(@cruz.engine).to eq(:ice)
            expect(@cruz.registration_date).to eq(nil)
        end

    end

    describe '# car registration' do

        it 'registration date gets updated' do
            expect(@cruz.registration_date).to eq(nil)
            @facility.add_service('Vehicle Registration')
            @facility.register_vehicle(@cruz)
            expect(@cruz.registration_date).to be_an_instance_of (Date)
        end

        it 'updates plate type' do
            expect(@cruz.registration_date).to eq(nil)
            @facility.add_service('Vehicle Registration')
            @facility.register_vehicle(@cruz)
            expect(@cruz.registration_date).to be_an_instance_of (Date)
        end

        describe '# accumulates fees' do

            it 'accumulates fees (antique)' do
                expect(@camaro.plate_type).to eq(nil)
                @facility.add_service('Vehicle Registration')
                @facility.register_vehicle(@camaro)
                expect(@camaro.fees).to eq(25)
            end

            it 'accumulates fees (ev)' do
                expect(@bolt.plate_type).to eq(nil)
                @facility.add_service('Vehicle Registration')
                @facility.register_vehicle(@bolt)
                expect(@bolt.fees).to eq(200)
            end

            it 'accumulates fees (regular)' do
                expect(@cruz.plate_type).to eq(nil)
                @facility.add_service('Vehicle Registration')
                @facility.register_vehicle(@cruz)
                expect(@cruz.fees).to eq(100)
            end

        end

    end

    describe '# antique?' do

        it 'can determine if a vehicle is an antique' do
            expect(@cruz.antique?).to eq(false)
            expect(@bolt.antique?).to eq(false)
            expect(@camaro.antique?).to eq(true)
        end

    end

    describe '# electric_vehicle?' do

        it 'can determine if a vehicle is an ev' do
            expect(@cruz.electric_vehicle?).to eq(false)
            expect(@bolt.electric_vehicle?).to eq(true)
            expect(@camaro.electric_vehicle?).to eq(false)
        end

    end

end
