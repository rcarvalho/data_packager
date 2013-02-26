require 'test/unit'
require 'data_packager'

class DataPackagerTest < Test::Unit::TestCase
  def test_package_unpackage_data
    @data = []
    @data << "SOME TYPE OF DATA THAT WE'RE TRYING TO SEND"
    @data << "NEXT STRING TO SEND"
    packaged_data = DataPackager.package(@data[0])
    assert_match /#{DataPackager.class_variable_get(:@@separator)}/, packaged_data
    packaged_data += DataPackager.package(@data[1])
    iter = 0
    DataPackager.unpackage(packaged_data) do |packet|
      assert_equal @data[iter], packet
      iter += 1
    end    
  end
end