require 'spec_helper'
require './lib/registrant'

RSpec.describe Dmv do
    xit 'can initialize' do
        registrant_1 = Registrant.new('Bruce', 18, true )
        #=> #<Registrant:0x000000015c10bed8 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>
        registrant_2 = Registrant.new('Penny', 15 )
        #=> #<Registrant:0x000000015c0778c8 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>
    
        expect(registrant_1.name).to eq("Bruce")
        expect(registrant_1.age).to eq(18)
        expect(registrant_1.permit?).to eq(true)
        expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(registrant_2.permit?).to eq(false)    
    end

    it 'can change permit value' do
        registrant_2 = Registrant.new('Penny', 15 )
        expect(registrant_2.permit?).to eq(false)

        registrant_2.earn_permit
        expect(registrant_2.permit?).to eq(true)
    end
end