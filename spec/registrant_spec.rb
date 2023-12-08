require 'spec_helper'
require './lib/registrant'

RSpec.describe Registrant do
    
    describe 'intialize' do 
        it 'creates a new registrant with permit set to false' do
            registrant = Registrant.new("Bruce" , 18)
            expect(registrant.permit).to be_falsey
        end
    end
end
