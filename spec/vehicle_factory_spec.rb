require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @ny_ev_registrations = DmvDataService.new.ny_ev_registrations
  end
  describe 'initialize' do
    it 'can initialize' do

      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end
  
  describe '#create_vehicles' do
    it 'returns vehicles from the factory' do

      expect(@factory.create_vehicles(@wa_ev_registrations)).to all be_a(Vehicle)
    end
  end

  describe '#most_popular' do
    it 'returns the vehicle make and model that is most popular' do
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.most_popular).to eq("NISSAN Leaf")
    end
  end

  describe '#count_by_year' do
    it 'returns the count of vehicles for a model year' do
      @factory.create_vehicles(@wa_ev_registrations)

      expect(@factory.amount_for_year("2012")).to eq(33)
      expect(@factory.count_by_year).to eq([["2023", 56], ["2022", 84], ["2021", 113], ["2020", 66], ["2019", 87], ["2018", 138], ["2017", 78], ["2016", 105], ["2015", 57], ["2014", 68], ["2013", 90], ["2012", 33], ["2011", 25]])
    end
  end

  describe '#county_with_the_most_vehicles' do 
    it 'returns the county with the most amount of vehicles' do
      @factory.create_vehicles(@wa_ev_registrations)

      expect(@factory.county_with_the_most_vehicles).to eq(["King", 799])
    end
  end

  describe 'addition of ny registration data' do
    it 'works with each method of the vehicle factory' do
      @factory.create_vehicles(@ny_ev_registrations)
      
      expect(@factory.create_vehicles(@ny_ev_registrations)).to all be_a(Vehicle)
      expect(@factory.most_popular).to eq("AR/CA SNOW")
      expect(@factory.amount_for_year("1999")).to eq(357)
      expect(@factory.count_by_year).to eq([["2020", 1], ["2016", 1], ["2015", 1], ["2011", 1], ["2009", 2], ["2008", 1], ["2007", 1], ["2005", 1], ["2004", 1], ["2003", 3], ["2002", 2], ["2001", 2], ["2000", 3], ["1999", 357], ["1998", 185], ["1997", 4], ["1996", 5], ["1995", 1], ["1994", 1], ["1993", 4], ["1992", 1], ["1991", 1], ["1990", 2], ["1989", 12], ["1988", 5], ["1987", 2], ["1986", 2], ["1985", 3], ["1984", 12], ["1983", 4], ["1982", 1], ["1981", 1], ["1980", 4], ["1979", 5], ["1978", 17], ["1977", 2], ["1976", 3], ["1975", 6], ["1974", 7], ["1973", 21], ["1972", 38], ["1971", 40], ["1970", 21], ["1969", 8], ["1968", 8], ["1967", 6], ["1966", 5], ["1965", 7], ["1964", 10], ["1963", 4], ["1962", 4], ["1961", 2], ["1960", 2], ["1959", 5], ["1958", 3], ["1957", 2], ["1956", 5], ["1955", 2], ["1954", 1], ["1953", 1], ["1952", 2], ["1951", 3], ["1950", 1], ["1949", 1], ["1948", 6], ["1947", 11], ["1946", 54], ["1945", 2], ["1942", 4], ["1941", 9], ["1940", 12], ["1939", 5], ["1937", 3], ["1936", 9], ["1935", 1], ["1934", 2], ["1932", 1], ["1931", 1], ["1929", 1], ["1927", 1], ["1924", 5], ["1923", 3], ["1915", 1]])
      expect(@factory.county_with_the_most_vehicles).to eq(["ERIE", 57])
    end
  end
end