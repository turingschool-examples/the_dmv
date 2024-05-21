RSpec.describe VehicleFactory do
    describe 'create_vehicles' do
      it 'creates electric vehicles from custom registration data' do    
        vehicle_details = [
          { vin: 'VIN123', year: 2020, make: 'Tesla', model: 'Model S', engine: :ev },
          { vin: 'VIN456', year: 2019, make: 'Nissan', model: 'Leaf', engine: :ev }
        ]
  
        factory = VehicleFactory.new
  
        electric_vehicles = factory.create_vehicles(vehicle_details)
        expect(electric_vehicles).to be_an(Array)
  
        electric_vehicles.each do |vehicle|
          expect(vehicle).to be_an_instance_of(Vehicle)
          expect(vehicle.electric?).to eq(true)
        end
      end
    end
  end
  