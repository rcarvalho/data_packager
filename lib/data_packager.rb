class DataPackager
  @@separator = "||$#BR&*||"
  
  def self.separator= str
    @@separator = str
  end
  
  def self.package data
    data + @@separator
  end

  def self.unpackage data_stream
    @@separator_size ||= @@separator.size
    if data_stream != ''
      while i = data_stream.index(@@separator) do
        packet = data_stream.slice!(0..i-1)
        data_stream.slice!(0..@@separator_size-1)
        yield packet if !packet.nil? || packet != ''
      end
    end
  end

end