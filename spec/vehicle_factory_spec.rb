require 'spec_helper'

RSpec.describe VehicleFactory do
  let(:factory) {VehicleFactory.new}
  let(:wa_ev_registrations) {DmvDataService.new.wa_ev_registrations}

  it 'exists' do
    expect(factory).to be_a(VehicleFactory)
  end

  describe '#create vehicles' do
    it 'the factory can create vehicles' do
      factory.create_vehicles(wa_ev_registrations).each do |vehicle|
        # require 'pry'; binding.pry
        expect(vehicle).to be_a Vehicle
      end
    end

    it 'matches the first vehicle in the data base array' do
      vehicle_1 = Vehicle.new({
        :engine => :ev,
        :make =>  "TOYOTA",
        :model =>  "Prius Plug-in",
        :plate_type =>  nil,
        :registration_date =>  nil,
        :vin =>  "JTDKN3DP8D",
        :year =>  "2013"
      })

      expect(factory.create_vehicles(wa_ev_registrations)[0].engine).to eq(vehicle_1.engine)
      expect(factory.create_vehicles(wa_ev_registrations)[0].make).to eq(vehicle_1.make)
      expect(factory.create_vehicles(wa_ev_registrations)[0].model).to eq(vehicle_1.model)
      expect(factory.create_vehicles(wa_ev_registrations)[0].plate_type).to eq(vehicle_1.plate_type)
      expect(factory.create_vehicles(wa_ev_registrations)[0].registration_date).to eq(vehicle_1.registration_date)
      expect(factory.create_vehicles(wa_ev_registrations)[0].vin).to eq(vehicle_1.vin)
      expect(factory.create_vehicles(wa_ev_registrations)[0].year).to eq(vehicle_1.year)
    end
  end



end