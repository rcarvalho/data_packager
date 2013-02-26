************************ 
data_packager GEM
************************

This gem allows one to package and unpackage data using a separator to send over the wire through sockets.

example:
# There is a default separator, but you can customize it as well.
DataPackager.separator = "!!!THISISMYSEPARATOR!!!"
str = 'DATA TO PACKAGE'

packaged_data = DataPackager.package(str)

DataPackager.unpackage(packaged_data) do |packet|
  puts "Data package and unpackage works: #{str == packet}"
end