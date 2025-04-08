require 'spec_helper'

RSpec.describe Dmv do
  before(:each) do
    @dmv = Dmv.new
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @facility_3 = Facility.new({name: 'DMV Northwest Branch', address: '3698 W. 44th Avenue Denver CO 80211', phone: '(720) 865-4600'})
    
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@dmv).to be_an_instance_of(Dmv)
      expect(@dmv.facilities).to eq([])
      end
  end

  describe '#add facilities' do
    it 'can add available facilities' do
      expect(@dmv.facilities).to eq([])
      @dmv.add_facility(@facility_1)
      expect(@dmv.facilities).to eq([@facility_1])
    end
  end

  describe '#facilities_offering_service' do
    it 'can return list of facilities offering a specified Service' do
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_2.add_service('New Drivers License')
      @facility_2.add_service('Road Test')
      @facility_2.add_service('Written Test')
      @facility_3.add_service('New Drivers License')
      @facility_3.add_service('Road Test')

      @dmv.add_facility(@facility_1)
      @dmv.add_facility(@facility_2)
      @dmv.add_facility(@facility_3)
      
      expect(@dmv.facilities_offering_service('Road Test')).to eq([@facility_2, @facility_3])
    end
  end


  let(:co_dmv_office_locations) do
    [{ 
        dmv_office: 'DMV Tremont Branch',
        address_li: '2855 Tremont Place Suite 118 Denver CO 80205',
        address__1: '2855 Tremont Place Suite 118 Denver CO 80205',
        phone: '(720) 865-4600',
        services_p: ['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'],
        registered_vehicles: ['123456789abcdefgh', '987654321abcdefgh', '1a2b3c4d5e6f'],
        collected_fees: 0
      }]
  end

  it 'can import facility data' do
    dmv = Dmv.new
    @facilities = dmv.co_facilities(co_dmv_office_locations)

    expect(@facilities).to be_an(Array)
    expect(@facilities.length).to be(1)

    facility = dmv.facilities.first
    
    expect(facility).to be_an_instance_of(Facility)
    expect(facility.name).to eq("DMV Tremont Branch")
    expect(facility.address).to eq("2855 Tremont Place Suite 118 Denver CO 80205")
    expect(facility.address_1).to eq("2855 Tremont Place Suite 118 Denver CO 80205")
    expect(facility.phone).to eq("(720) 865-4600")
    expect(facility.services).to eq(["New Drivers License", "Renew Drivers License", "Vehicle Registration"])

  end
  let(:ny_office_locations) do
    [{
      :office_name=>"LAKE PLACID",
      :street_address_line_1=>"2693 MAIN STREET",
      :city=>"LAKE PLACID",
      }]
  end



  it 'can import facility data ny' do
    dmv = Dmv.new
    @facilities = dmv.ny_facilities(ny_office_locations)

    expect(@facilities).to be_an(Array)
    expect(@facilities.length).to be(1)

    facility = dmv.facilities.first
    
    expect(facility).to be_an_instance_of(Facility)
    expect(facility.name).to eq("LAKE PLACID")
    expect(facility.address).to eq("2693 MAIN STREET")
    expect(facility.address_1).to eq("LAKE PLACID")
    expect(facility.phone).to eq(nil)
    expect(facility.services).to eq([])
  end



  let(:mo_office_locations) do
    [{
      :name=>"Cameron",
      :address1=>"588 Lana DR",
      :city=>"Cameron",
      :phone=>"(816 632-4838)"
      }]
  end



  it 'can import facility data mo' do
    dmv = Dmv.new
    @facilities = dmv.mo_facilities(mo_office_locations)

    expect(@facilities).to be_an(Array)
    expect(@facilities.length).to be(1)

    facility = dmv.facilities.first

    expect(facility).to be_an_instance_of(Facility)
    expect(facility.name).to eq("Cameron")
    expect(facility.address).to eq("588 Lana DR")
    expect(facility.address_1).to eq("Cameron")
    expect(facility.phone).to eq("(816 632-4838)")
    expect(facility.services).to eq([])

  end
end


