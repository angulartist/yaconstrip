# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class CoreStringSegment < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @metadata = Metadata.new(@_io, self, @_root)
    @structure = Structure.new(@_io, self, @_root)
    self
  end
  class Alpha < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @left = @_io.read_bits_int_be(6)
      @right = @_io.read_bits_int_be(6)
      self
    end
    attr_reader :left
    attr_reader :right
  end

  ##
  # TC Consent Management Platform
  class Metadata < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_bits_int_be(6)
      @created = @_io.read_bits_int_be(32)
      @created_overflow = @_io.read_bits_int_be(4)
      @last_updated = @_io.read_bits_int_be(32)
      @last_updated_overflow = @_io.read_bits_int_be(4)
      @_io.align_to_byte
      @cmp = Cmp.new(@_io, self, @_root)
      @gvl_version = @_io.read_bits_int_be(12)
      self
    end

    ##
    # Consent Management Platform
    class Cmp < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @id = @_io.read_bits_int_be(12)
        @version = @_io.read_bits_int_be(12)
        @screen = @_io.read_bits_int_be(6)
        @_io.align_to_byte
        @language = Alpha.new(@_io, self, @_root)
        self
      end
      attr_reader :id
      attr_reader :version
      attr_reader :screen

      ##
      # ISO 3166-1 alpha-2 code used identify a country or a language
      attr_reader :language
    end

    ##
    # Supported version is above 2 (TCF 2.O)
    attr_reader :version

    ##
    # Timestamp
    attr_reader :created

    ##
    # Timestamp
    attr_reader :created_overflow

    ##
    # Timestamp
    attr_reader :last_updated

    ##
    # Timestamp
    attr_reader :last_updated_overflow
    attr_reader :cmp

    ##
    # Global Vendor List version
    attr_reader :gvl_version
  end
  class Structure < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @policy_version = @_io.read_bits_int_be(6)
      @is_service_specific = @_io.read_bits_int_be(1) != 0
      @use_non_standard_texts = @_io.read_bits_int_be(1) != 0
      @special_feature_opt_ins = []
      (12).times { |i|
        @special_feature_opt_ins << @_io.read_bits_int_be(1) != 0
      }
      @purposes_consent = []
      (24).times { |i|
        @purposes_consent << @_io.read_bits_int_be(1) != 0
      }
      @purposes_li_transparency = []
      (24).times { |i|
        @purposes_li_transparency << @_io.read_bits_int_be(1) != 0
      }
      @_io.align_to_byte
      @sj_disclosures = SjDisclosures.new(@_io, self, @_root)
      @vendor_consent = VendorSection.new(@_io, self, @_root)
      @vendor_li = VendorSection.new(@_io, self, @_root)
      @pub_restrictions = PubRestrictionsSection.new(@_io, self, @_root)
      self
    end
    class PubRestrictionsSection < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @num_pub_restrictions = @_io.read_bits_int_be(12)
        @_io.align_to_byte
        if num_pub_restrictions > 0
          @pub_restriction_entries = []
          (num_pub_restrictions).times { |i|
            @pub_restriction_entries << PubRestrictionEntry.new(@_io, self, @_root)
          }
        end
        self
      end
      class PubRestrictionEntry < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @purpose_id = @_io.read_bits_int_be(6)
          @restriction_type = @_io.read_bits_int_be(2)
          @_io.align_to_byte
          @range_section = RangeSection.new(@_io, self, @_root)
          @num_entries = @_io.read_bits_int_be(12)
          @_io.align_to_byte
          @range_entries = []
          (num_entries).times { |i|
            @range_entries << RangeEntry.new(@_io, self, @_root)
          }
          self
        end
        attr_reader :purpose_id
        attr_reader :restriction_type
        attr_reader :range_section
        attr_reader :num_entries
        attr_reader :range_entries
      end
      attr_reader :num_pub_restrictions
      attr_reader :pub_restriction_entries
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

    ##
    # Specific Jurisdiction Disclosures
    class SjDisclosures < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @purpose_one_treatment = @_io.read_bits_int_be(1) != 0
        @_io.align_to_byte
        @pub_country = Alpha.new(@_io, self, @_root)
        self
      end
      attr_reader :purpose_one_treatment

      ##
      # Publisher Country Code
      attr_reader :pub_country
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
    attr_reader :policy_version
    attr_reader :is_service_specific
    attr_reader :use_non_standard_texts
    attr_reader :special_feature_opt_ins
    attr_reader :purposes_consent
    attr_reader :purposes_li_transparency

    ##
    # Specific Jurisdiction Disclosures
    attr_reader :sj_disclosures
    attr_reader :vendor_consent
    attr_reader :vendor_li
    attr_reader :pub_restrictions
  end
  attr_reader :metadata
  attr_reader :structure
end
