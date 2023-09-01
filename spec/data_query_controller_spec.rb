require 'spec_helper'

RSpec.describe DataQuery do
  before(:each) do
    @dq = DataQuery.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@dq).to be_a DataQuery
    end

    it 'loads all data into objects' do
      expect(@dq.instance_variables.length).to be >= 2
    end
  end

  describe '#parse_input' do
    it 'prompts & accepts input' do
      allow($stdin).to receive(:gets) { "t" }
      expect(@dq.parse_input).to eq false # must enter 't'
    end

    it 'rejects bad input' do
      allow($stdin).to receive(:gets) { "1 NY" }
      expect(@dq.parse_input).to eq true
      allow($stdin).to receive(:gets) { "3 NY gas" }
      expect(@dq.parse_input).to eq true
      allow($stdin).to receive(:gets) { "4 NY gas" }
      expect(@dq.parse_input).to eq false
    end

    it 'will quit with q:' do
      allow($stdin).to receive(:gets) { "q:" }
      expect(@dq.parse_input).to eq nil
    end
  end

  describe '#query_handler' do
    it 'prompts & parses' do
      allow($stdin).to receive(:gets) { "1 NY" }
      expect(@dq.parse_input).to eq true
      expect(@dq.live).to eq true
      allow($stdin).to receive(:gets) { "q:" }
      expect(@dq.parse_input).to eq nil
      expect(@dq.live).to eq false
    end
  end

  describe '#query_summary' do
    it 'provided summary data for given state' do
      
    end
  end
end