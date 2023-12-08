require 'spec_helper'

RSpec.describe Analytics do

  describe '#most_popular_make_model' do
    it 'return the most popular make and model from EV registration' do
      analytics = Analytics.new
      ev_registration = [ {:make=>"Tesla", :model=>"3"},
                          {:make=>"Tesla", :model=>"Y"},
                          {:make=>"Tesla", :model=>"Y"},
                          {:make=>"Tesla", :model=>"3"},
                          {:make=>"Tesla", :model=>"Y"},
                          {:make=>"Nissan", :model=>"Leaf"},
                          {:make=>"Chevrolet", :model=>"Bolt EV"}
                        ]
      result = analytics.find_most_popular_make_and_model(ev_registration)

      expect(result).to eq ({most_popular_make:["Tesla", 5], most_popular_model:["Y", 3]})

    end
  end
end
