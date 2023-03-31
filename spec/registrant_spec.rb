require 'spec_helper'

RSpec.describe Registrant do
  it 'exists' do
    registrant = Registrant.new
    expect(registrant).to be_an_instance_of(Registrant)
  end

  
end