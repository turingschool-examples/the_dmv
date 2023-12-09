require 'spec_helper'

RSpec.describe Analyzer do
    describe '#initialize' do
        it 'exists' do
            analyzer = Analyzer.new

            expect(analyzer).to be_a(Analyzer)
        end
    end

    describe '#most_popular_vehicle(vehicles)' do
        it 'can analyze an array of one vehicle and return the make and model' do
            cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
            analyzer = Analyzer.new

            vehicles = [cruz]

            expect(analyzer.most_popular_vehicle(vehicles)).to eq(['Chevrolet', 'Cruz'])
        end

        it 'can analyze multiple vehicles and return the make and model of the most popular' do
            cruz_1 = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
            cruz_2 = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
            camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
            bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
            analyzer = Analyzer.new

            vehicles = [cruz_1, cruz_2, camaro, bolt]

            expect(analyzer.most_popular_vehicle(vehicles)).to eq(['Chevrolet', 'Cruz'])
        end

        it 'will return an empty array if given no vehicles' do
            analyzer = Analyzer.new

            vehicles = []

            expect(analyzer.most_popular_vehicle(vehicles)).to eq([])
        end
    end
end