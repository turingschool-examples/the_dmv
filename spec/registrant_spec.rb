require 'spec_helper'

RSpec.describe Registrant do
  let(:registrant_1) { Registrant.new('Bruce', 18, true ) }
  let(:registrant_2) { Registrant.new('Penny', 15) }
  describe 'initialize' do
    it 'can initialize' do
      expect(registrant_1).to be_an_instance_of(Registrant) 
    end
end