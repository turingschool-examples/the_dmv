require 'spec_helper'

RSpec.describe Facility do
    facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    facility_1.add_service('Vehicle Registration')

    it "properly creates new Classes" do
        expect(cruz.registration_date).to eq(nil)
        expect(facility_1.registered_vehicles).to eq([])
        expect(facility_1.collected_fees).to eq(0)
    end

    facility_1.register_vehicle(cruz)
    current_time = DateTime.now  
    facility_1.register_vehicle(camaro)
    facility_1.register_vehicle(bolt)

    it "registers vehicles correctly" do
        expect(cruz.registration_date).to eq(current_time)
        #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>
        expect(cruz.plate_type).to eq(:regular)
        expect(camero.plate_type).to eq(:antique)
        expect(bolt.plate_type).to eq(:ev)
        expect(facility_1.registered_vehicles).to eq(cruz)
        expect(facility_1.collected_fees).to eq(325)
        expect(facility_1.registered_vehicles).to eq([cruz,camero,bolt])
        expect(facility_1.collected_fees).to eq(325)
    end

    it "facility 2 still empty" do
        expect(facility_2.registered_vehicles).to eq([])
        expect(facility_2.services).to eq([])
        expect(facility_2.registered_vehicles).to eq([])
    end

pry(main)> facility_2.registered_vehicles
#=> []

pry(main)> facility_2.services
#=> []

pry(main)> facility_2.register_vehicle(bolt)
#=> nil

pry(main)> facility_2.registered_vehicles
#=> []

pry(main)> facility_2.collected_fees
#=> 0
end
