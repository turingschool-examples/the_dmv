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

  describe '#count_registered_vehicles_by_model_year' do
    it 'count the registered vehicles by model year' do
      analytics = Analytics.new
      ev_registration = [ {:model_year=>2020},
                          {:model_year=>2020},
                          {:model_year=>2020},
                          {:model_year=>2021},
                          {:model_year=>2021},
                          {:model_year=>2022}
                        ]

      model_year_count = analytics.count_registered_vehicles_by_model_year(ev_registration)

      expect(model_year_count[2020]).to eq (3)
      expect(model_year_count[2021]).to eq (2)
      expect(model_year_count[2022]).to eq (1)
    end
  end
end
