module TestData
  REGISTRANT_1 = {
    name: 'Bruce',
    age: 18,
    permit: true
  }.freeze
  REGISTRANT_2 = {
    name: 'Penny',
    age: 16
  }.freeze
  REGISTRANT_3 = {
    name: 'Tucker',
    age: 15
  }.freeze

  CRUZ = {
    vin: '123456789abcdefgh',
    year: 2012,
    make: 'Chevrolet',
    model: 'Cruz',
    engine: :ice
  }.freeze
  BOLT = {
    vin: '987654321abcdefgh',
    year: 2019,
    make: 'Chevrolet',
    model: 'Bolt',
    engine: :ev
  }.freeze
  CAMARO = {
    vin: '1a2b3c4d5e6f',
    year: 1969,
    make: 'Chevrolet',
    model: 'Camaro',
    engine: :ice
  }.freeze

  WA_EV_VEHICLE = {
    vin: 'JTDKN3DP8D',
    year: '2013',
    make: 'TOYOTA',
    model: 'Prius Plug-in',
    engine: :ev
  }.freeze

  FACILITY_1 = {
    name: 'Albany DMV Office',
    address: '2242 Santiam Hwy SE Albany OR 97321',
    phone: '541-967-2014'
  }.freeze
  FACILITY_2 = {
    name: 'Ashland DMV Office',
    address: '600 Tolman Creek Rd Ashland OR 97520',
    phone: '541-776-6092'
  }.freeze
  FACILITY_3 = {
    name: 'Bend DMV Office',
    address: '63030 O B Riley Rd Bend OR 97701',
    phone: '541-388-6322'
  }.freeze
end
