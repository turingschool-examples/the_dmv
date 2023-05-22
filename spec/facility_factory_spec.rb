require './lib/facility'
require './lib/facility_factory'
require './lib/dmv_data_service'


RSpec.describe Facility_factory do
  before(:each) do
    @factory = Facility_factory.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#create_facility' do
    it 'can create facilities using the dmv data' do
      expect(@factory.create_facility(@or_dmv_office_locations)).to be_an(Array)
      expect(@factory.create_facility(@or_dmv_office_locations)[0]).to be_a(Facility)
      # expect(@factory.create_facility(@or_dmv_office_locations)).to eq([])
    end

    it 'can create NY facilities using the dmv data' do
    expect(@factory.create_facility(@ny_dmv_office_locations)).to be_an(Array)
    expect(@factory.create_facility(@ny_dmv_office_locations)[0]).to be_a(Facility)
    # expect(@factory.create_facility(@ny_dmv_office_locations)).to eq([])
    end

    it 'can create MO facilities using the dmv data' do
      expect(@factory.create_facility(@mo_dmv_office_locations)).to be_an(Array)
      expect(@factory.create_facility(@mo_dmv_office_locations)[0]).to be_a(Facility)
      # expect(@factory.create_facility(@mo_dmv_office_locations)).to eq([])
    end
  end

  describe "#ny_parser" do
    it "can parse the data" do
      expected = @ny_dmv_office_locations.first

      expect(@factory.ny_parser(expected)[:address]).to eq("168-46 91ST AVE., 2ND FLR JAMAICA NY 11432")
      expect(@factory.ny_parser(expected)[:name]).to eq("JAMAICA KIOSK")
      expect(@factory.ny_parser(expected)[:phone]).to eq(nil)
    end
  end

  describe "#mo_parser" do
    it "can parse the data" do
      expected = @mo_dmv_office_locations.first

      expect(@factory.mo_parser(expected)[:address]).to eq("10425 WEST FLORISSANT FERGUSON MO 63136")
      expect(@factory.mo_parser(expected)[:name]).to eq("FERGUSON-OFFICE CLOSED UNTIL FURTHER NOTICE")
      expect(@factory.mo_parser(expected)[:phone]).to eq("(314) 733-5316")
    end
  end

  describe "#or_parser" do
    it "can parse the data" do
      expected = @or_dmv_office_locations.first

      expect(@factory.or_parser(expected)[:address]).to eq("2242 Santiam Hwy SE Albany OR 97321")
      expect(@factory.or_parser(expected)[:name]).to eq("Albany DMV Office")
      expect(@factory.or_parser(expected)[:phone]).to eq("541-967-2014")
    end
  end
end