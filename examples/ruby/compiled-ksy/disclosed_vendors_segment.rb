# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class DisclosedVendorsSegment < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @segment_type = @_io.read_bits_int_be(3)
    @_io.align_to_byte
    @vendor_consent = VendorSection.new(@_io, self, @_root)
    self
  end
  class VendorSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @max_vendor_id = @_io.read_bits_int_be(16)
      @is_range_encoding = @_io.read_bits_int_be(1) != 0
      if !(is_range_encoding)
        @bit_field = []
        (max_vendor_id).times { |i|
          @bit_field << @_io.read_bits_int_be(1) != 0
        }
      end
      @_io.align_to_byte
      if is_range_encoding
        @range_section = RangeSection.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :max_vendor_id
    attr_reader :is_range_encoding
    attr_reader :bit_field
    attr_reader :range_section
  end
  class RangeSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_entries = @_io.read_bits_int_be(12)
      @_io.align_to_byte
      @range_entries = []
      (num_entries).times { |i|
        @range_entries << RangeEntry.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :num_entries
    attr_reader :range_entries
  end
  class RangeEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @is_a_range = @_io.read_bits_int_be(1) != 0
      @start_or_only_vendor_id = @_io.read_bits_int_be(16)
      if is_a_range
        @end_vendor_id = @_io.read_bits_int_be(16)
      end
      self
    end
    attr_reader :is_a_range
    attr_reader :start_or_only_vendor_id
    attr_reader :end_vendor_id
  end
  attr_reader :segment_type
  attr_reader :vendor_consent
end
