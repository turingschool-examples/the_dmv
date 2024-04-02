require 'spec_helper'
require 'pry'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe FunFacts do
    it 'exists' do
        fun_facts = FunFacts.new

        expect(fun_facts).to be_an_instance_of(FunFacts)
    end

    it 'can find the most popular ev make of vehicle registered in WA' do
        washington_fun_facts = FunFacts.new
        wa_dmvs = DmvDataService.new.wa_ev_registrations

        wa_fun_facts.most_popular_make(wa_dmvs)

        expect(washington_fun_facts).to eq("TESLA")
        binding.pry
    end
end