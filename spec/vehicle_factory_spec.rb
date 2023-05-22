require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end
    
    describe '#it exists' do
        it 'it exists' do
            expect(@factory).to be_an_instance_of(VehicleFactory)
        end
    end

    describe '#create vehicles' do
        it 'creates vehicles using the WA EV registrations' do
            vehicle_1 = Vehicle.new(@engine=:ev, @make="TOYOTA", @model="Prius Plug-in", @plate_type=nil, @registration_date=nil, @vin="JTDKN3DP8D", @year="2013")
            vehicle_2 = Vehicle.new(@engine=:ev, @make="TOYOTA", @model="Prius Prime", @plate_type=nil, @registration_date=nil, @vin="JTDKARFP9J", @year="2018")
            vehicle_3 = Vehicle.new(@engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018")
            new_vehicles = [vehicle_1, vehicle_2, vehicle_3]
            expect(@factory.create_vehicles(wa_ev_registrations)).to eq(new_vehicles)
        end
    end
end