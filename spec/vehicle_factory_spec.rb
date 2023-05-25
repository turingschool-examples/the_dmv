require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/facility'

RSpec.describe VehicleFactory do
    before(:each) do
        @vehicle_factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
        @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
        @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    end 

    describe '#initialize' do
        it 'can initialize' do
            expect(@vehicle_factory).to be_a(VehicleFactory)
        end 
    end

    describe '#creates vehicles' do 
        it 'can create new vehicles' do 
            new_vehicles = @vehicle_factory.create_vehicles(@wa_ev_registrations)
            expect(new_vehicles).to be_a(Vehicle) 
        end    
    end

    describe '#create facilities' do 
        xit 'can create new facility objects' do 
            oregon_facilities = @vehicle_factory.create_facility(@or_dmv_office_locations)
            expect(oregon_facilities).to be_a(Facility)

            washington_facilities = @vehicle_factory.create_facility(@wa_ev_registrations)
            expect(washington_facilities).to be_a(Facility)

            ny_facilities = @vehicle_factory.create_facility(@ny_dmv_office_locations)
            expect(ny_facilities).to be_a(Facility)

            missouri_facilities = @vehicle_factory.create_facility(@mo_dmv_office_locations)
            expect(missouri_facilities).to be_a(Facility)
        end
    end
end