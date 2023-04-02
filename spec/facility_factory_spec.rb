require 'spec_helper'

RSpec.describe FacilityFactory do
  it "creates a facility from a list of one facility" do
    factory = FacilityFactory.new
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'})
   
    created_facility = factory.create_facility([{name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'}])
    
    # factory = VehicleFactory.new
    # @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    # created_vehicles = factory.create_vehicles([{vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice}])
    

    # expect(created_vehicles[0].vin).to eq(@cruz.vin)
    # expect(created_vehicles[0].year).to eq(@cruz.year)
    # expect(created_vehicles[0].make).to eq(@cruz.make)
    # expect(created_vehicles[0].model).to eq(@cruz.model)
  end
end