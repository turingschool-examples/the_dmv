require 'spec_helper'
require 'pry'

RSpec.describe Vehicle do
    before(:each) do
      registrant_1 = Registrant.new()
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    end
end