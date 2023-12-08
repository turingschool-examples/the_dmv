require 'spec_helper'
require './lib/registrant'

RSpec.describe Registrant do
  
    describe 'intialize' do 
        it 'exsist' do
            registrant = Registrant.new("Bruce", 18)
            expect(registrant).to be_an_instance_of(Registrant)
            expect(registrant.age).to eq(18)
            expect(registrant.name).to eq("Bruce")
            expect(registrant.permit?).to be false
        end
        
        it 'creates a new registrant with permit already acquired' do
            registrant = Registrant.new("Bruce" , 18, true)
            expect(registrant.permit?).to be true
        end
    end

    describe 'earn_permit' do
        it 'changes permit return from false to true' do
            registrant = Registrant.new("Bruce", 18)
            registrant.earn_permit
            expect(registrant.permit?).to be true
        end
    end
end