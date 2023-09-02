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

  describe '#bad_input' do
    it 'prompts with bad input feedback' do
      allow($stdin).to receive(:gets) { "4 NY gas" }
      expect(@dq.parse_input).to eq false
      allow($stdin).to receive(:gets) { "3 AZ gas" }
      expect(@dq.parse_input).to eq false
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
    it 'provides summary data for given state' do
      allow($stdin).to receive(:gets) { "1 NY" }
      expect(@dq.parse_input).to eq true
      allow($stdin).to receive(:gets) { "1 WA" }
      expect(@dq.parse_input).to eq true
    end
  end

  describe '#state_helper' do
    it 'returns the correct array object when passed a state string' do
      expect(@dq.state_helper('ny')).to be_an Array
      expect(@dq.state_helper('wa')).to be_an Array
    end
  end

  describe '#query_year' do
    it 'will return a count of registered vehicles by year' do
      allow($stdin).to receive(:gets) { "2 NY 1990" }
      expect(@dq.parse_input).to eq true
    end
  end

  describe '#query_engine' do
    it 'returns a count of registered vehicles by engine type' do
      allow($stdin).to receive(:gets) { "3 NY gas" }
      expect(@dq.parse_input).to eq true
      allow($stdin).to receive(:gets) { "3 WA ev" }
      expect(@dq.parse_input).to eq true
    end
  end

  describe '#print_query_header' do
    it 'formats the prompt more clearly' do
      expect(@dq.print_query_header).to eq nil
    end
  end
end