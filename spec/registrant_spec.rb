require './lib/registrant'
require './lib/facility'

RSpec.describe Registrant do
  it 'creates a registrant with the given name, age, and permit status' do
    registrant_1 = Registrant.new('Bruce', 18, true)
    expect(registrant_1.name).to eq('Bruce')
    expect(registrant_1.age).to eq(18)
    expect(registrant_1.permit?).to be(true)
    expect(registrant_1.license_data).to eq({ written: false, license: false, renewed: false })
  end

  it 'creates a registrant with the given name, age, and permit status' do
    registrant_1 = Registrant.new('Penny', 15)
    expect(registrant_1.name).to eq('Penny')
    expect(registrant_1.age).to eq(15)
    expect(registrant_1.permit?).to be(false)
    expect(registrant_1.license_data).to eq({ written: false, license: false, renewed: false })
  end

  it 'does not give the registrant another permit' do
    registrant_1 = Registrant.new('Bruce', 18, true)
    expect(registrant_1.permit?).to be(true)
    registrant_1.earn_permit
    expect(registrant.permit?).to be(true)
  end



  it 'written, license, and renewed all false for reg_1' do
    registrant = Registrant.new('Bruce', 18, true )
    expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end

  it 'registrant_1 has a permit?' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    expect(registrant_1.permit?).to eq(true)
  end

  it 'administer written test?' do
    facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    registrant_1 = Registrant.new('Bruce', 18, true )
    expect(facility_1.administer_written_test(registrant_1)).to eq(false)
  end


registrant_1 = Registrant.new('Bruce', 18, true )
registrant_2 = Registrant.new('Penny', 16 )
registrant_3 = Registrant.new('Tucker', 15 )
facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

end
