
describe FacilityFactory do  
  it 'can batch #initialize Factory instances using external data from an api' do
    co_facilities = FacilityFactory.new.create_facilities(DmvDataService.new.co_dmv_office_locations)
    ny_facilities = FacilityFactory.new.create_facilities(DmvDataService.new.ny_dmv_office_locations)
    mo_facilities = FacilityFactory.new.create_facilities(DmvDataService.new.mo_dmv_office_locations)

    expect(co_facilities.count).to eq(5)
    expect(co_facilities[0].name).to eq(DmvDataService.new.co_dmv_office_locations[0][:dmv_office])
    expect(co_facilities[0].phone).to eq(DmvDataService.new.co_dmv_office_locations[0][:phone])
    expect(co_facilities[0].name).to eq('DMV Tremont Branch')
    expect(co_facilities.map{|facility| facility.collected_fees}.sum == 200000)

    expect(ny_facilities.count).to eq(172)
    expect(ny_facilities[0].name).to eq(DmvDataService.new.ny_dmv_office_locations[0][:office_name])
    expect(ny_facilities[0].phone).to eq(DmvDataService.new.ny_dmv_office_locations[0][:public_phone_number])
    expect(ny_facilities[0].name).to eq('EVANS')
    expect(ny_facilities.map{|facility| facility.collected_fees}.sum == 200000)

    expect(mo_facilities.count).to eq(178)
    expect(mo_facilities[0].name).to eq(DmvDataService.new.mo_dmv_office_locations[0][:name])
    expect(mo_facilities[0].phone).to eq(DmvDataService.new.mo_dmv_office_locations[0][:phone])
    expect(mo_facilities[0].name).to eq('OAKVILLE')
    expect(mo_facilities.map{|facility| facility.collected_fees}.sum == 200000)
  end
end