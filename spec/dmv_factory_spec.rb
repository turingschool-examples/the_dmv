require './spec/spec_helper'

RSpec.describe DmvFactory do
  it "can create facility objects in colorado" do
    factory = DmvFactory.new
    co_dmv_facilities = DmvDataService.new.co_dmv_office_locations
    reformatted_co_dmv_locations = factory.create_colorado_facilities(co_dmv_facilities)
    colorado_dmv = reformatted_co_dmv_locations.first

    expect(co_dmv_facilities.count).to eq(5)
    expect(colorado_dmv[:id]).to eq("1")
    expect(colorado_dmv[:address]).to eq("2855 Tremont Place")
    expect(colorado_dmv[:zip]).to eq("80205")
    expect(colorado_dmv[:phone]).to eq("(720) 865-4600")
  end

  it "can create facility objects in new york" do
    factory = DmvFactory.new
    ny_dmv_facilities = DmvDataService.new.ny_dmv_office_locations
    reformatted_ny_dmv_locations = factory.create_new_york_facilities(ny_dmv_facilities)
    new_york_dmv = reformatted_ny_dmv_locations.first

    expect(ny_dmv_facilities.count).to eq(173)
    expect(new_york_dmv[:address]).to eq("545 TITUS AVENUE")
    expect(new_york_dmv[:zip]).to eq("14617")
    expect(new_york_dmv[:phone]).to eq("5857531604")
  end

  it "can create facility objects in missouri" do
    factory = DmvFactory.new
    mo_dmv_facilities = DmvDataService.new.mo_dmv_office_locations
    reformatted_mo_dmv_locations = factory.create_missouri_facilities(mo_dmv_facilities)
    missouri_dmv = reformatted_mo_dmv_locations.first

    expect(mo_dmv_facilities.count).to eq(178)
    expect(missouri_dmv[:address]).to eq("10425 WEST FLORISSANT")
    expect(missouri_dmv[:zip]).to eq("63136")
    expect(missouri_dmv[:phone]).to eq("(314) 733-5316")
  end

end
