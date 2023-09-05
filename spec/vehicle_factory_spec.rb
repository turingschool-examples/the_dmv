require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do

  describe '#initialize' do
    it 'creates an instance of VehicleFactory' do
      factory = VehicleFactory.new
    
      expect(factory).to be_an_instance_of VehicleFactory
    end

  end

  describe '#create_vehicles' do
    it 'creates vehicles from wa_ev_registrations' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(wa_ev_registrations)

      expect(factory.vehicles.count).to be(1000)
      # factory.create_vehicles(wa_ev_registrations).each do |registration|
      #   expect(registration).to be_instance_of(Vehicle)
      # end
    end

  end

  describe 'iteration 4' do

    describe 'EV cars' do   
      before(:each) do
        @factory = VehicleFactory.new
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        @factory.create_vehicles(wa_ev_registrations)
      end

      it 'finds most popular make registered' do
        
        expect(@factory.popular_make).to eq("TESLA")
      end

      it 'finds most popular model registered' do

        expect(@factory.popular_model).to eq("Leaf")
      end

      it 'counts registered vehicles model year' do

        expect(@factory.vehicles_in_year("2015")).to eq(70)
        expect(@factory.vehicles_in_year("2019")).to eq(102)
        expect(@factory.vehicles_in_year("2007")).to eq(0)
      end

      it 'finds county with most registered vehicles' do
        
        expect(@factory.most_in_county).to eq("King")
      end

    end

    describe 'Boats' do
      before(:each) do
        @factory = VehicleFactory.new
        ny_boat_registrations = DmvDataService.new.ny_boat_registrations
        @factory.create_boats(ny_boat_registrations)
        require "pry"; binding.pry
      end
      it 'creates vehicles from ny_boat_registrations' do

        expect(@factory.vehicles.count).to eq(1000)
      end
    end
  end
  
end