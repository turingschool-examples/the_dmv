require 'writeexcel'
require './lib/wave_api'
require './lib/individual_wave_class'
require './lib/wave_factory'

wave = Wave.new.wave_api
@wave_factory = WaveFactory.new
vent_waves = @wave_factory.create_waves(wave)

# Create a new Excel Workbook
workbook = WriteExcel.new('ruby.xls')

# Add worksheet(s)
worksheet  = workbook.add_worksheet

# Add and define a format
format = workbook.add_format
format.set_bold
# format.set_color('red')
# format.set_align('right')

# write a formatted and unformatted string.
worksheet.write(0, 1, "Time", format)
worksheet.write(0, 2, "Wave Direction Dominant", format)
worksheet.write(0, 3, "Wave Height Max", format)
worksheet.write(0, 4, "Wave Period Max", format)

vent_waves.each_with_index do |wave, index|
  worksheet.write(index+1, 1, wave.time)
  worksheet.write(index+1, 2, wave.wave_direction_dominant)
  worksheet.write(index+1, 3, wave.wave_height_max) 
  worksheet.write(index+1, 4, wave.wave_period_max)
end

# write a number and formula using A1 notation
# worksheet.write('B4', 3.14159)
# worksheet.write('B5', '=SIN(B4/4)')

# write to file
workbook.close