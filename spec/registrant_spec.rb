require 'spec_helper'
require './lib/registrant'
require 'pry'

RSpec.describe Registrant do
  it 'exists' do
    expect(Registrant.new).to be_an_instance_of(Registrant) 
  end

  xit 'creates new registrant' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    expect(registrant_1).to be_a(Registrant)
  end
end

  


# registrant_2 = Registrant.new('Penny', 15 )