require 'spec_helper.rb'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Registrant do

    it 'registrants can exist' do
        registrant_1 = Registrant.new('Bruce', 18, true)
        registrant_2 = Registrant.new('Penny', 15)

        expect(registrant_1).to be_an_instance_of (Registrant)
        expect(registrant_2).to be_an_instance_of (Registrant)
    end

    it 'registrants have names' do
        registrant_1 = Registrant.new('Bruce', 18, true)
        registrant_2 = Registrant.new('Penny', 15)

        expect(registrant_1.name).to eq ("Bruce")
        expect(registrant_2.name).to eq ("Penny")
    end

    it 'registrants have an age' do
        registrant_1 = Registrant.new('Bruce', 18, true)
        registrant_2 = Registrant.new('Penny', 15)

        expect(registrant_1.age).to eq (18)
        expect(registrant_2.age).to eq (15)
    end

    it 'registrants do not have a permit when created' do
        registrant_1 = Registrant.new('Bruce', 18)
        registrant_2 = Registrant.new('Penny', 15)
        registrant_3 = Registrant.new('Jacqueline', 58)

        expect(registrant_1.permit).to eq (false)
        expect(registrant_2.permit).to eq (false)
    end   

    it 'registrants have a permit' do
        registrant_1 = Registrant.new('Bruce', 18, true)
        registrant_2 = Registrant.new('Penny', 15)

        expect(registrant_1.permit?).to eq (true)
        expect(registrant_2.permit?).to eq (false)
    end

    it 'registrants have blank license data' do
        registrant_1 = Registrant.new('Bruce', 18, true)
        registrant_2 = Registrant.new('Penny', 15)

        expect(registrant_1.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
        expect(registrant_2.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
    end

    it 'registrants can earn a permit' do
        registrant_2 = Registrant.new('Penny', 15)

        expect(registrant_2.permit?).to eq (false)

        registrant_2.earn_permit

        expect(registrant_2.permit?).to eq (true)
    end 

end