# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class PublisherTcSegment < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @segment_type = @_io.read_bits_int_be(3)
    @pub_purposes_consent = []
    (24).times { |i|
      @pub_purposes_consent << @_io.read_bits_int_be(1) != 0
    }
    @pub_purposes_li_transparency = []
    (24).times { |i|
      @pub_purposes_li_transparency << @_io.read_bits_int_be(1) != 0
    }
    @num_custom_purposes = @_io.read_bits_int_be(6)
    if num_custom_purposes > 0
      @custom_purposes_consent = []
      (num_custom_purposes).times { |i|
        @custom_purposes_consent << @_io.read_bits_int_be(1) != 0
      }
    end
    if num_custom_purposes > 0
      @custom_purposes_li_transparency = []
      (num_custom_purposes).times { |i|
        @custom_purposes_li_transparency << @_io.read_bits_int_be(1) != 0
      }
    end
    self
  end
  attr_reader :segment_type
  attr_reader :pub_purposes_consent
  attr_reader :pub_purposes_li_transparency
  attr_reader :num_custom_purposes
  attr_reader :custom_purposes_consent
  attr_reader :custom_purposes_li_transparency
end
