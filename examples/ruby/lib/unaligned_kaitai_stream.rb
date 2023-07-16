require 'kaitai/struct/struct'

class UnalignedKaitaiStream < Kaitai::Struct::Stream
    @segment_type = nil

    def initialize(data)
        super(data)
        self.reset
    end

    # We want an unaligned stream.
    # So we override the current
    # alignToByte method.
    def align_to_byte
    end

    def reset
        @bits = 0;
        @bits_left = 0;
        self.seek(0);
    end

    def read_segment_type
        @segment_type = self.read_bits_int_be(3)
        self.reset

        return @segment_type
    end

    def segment_type
        @segment_type
    end
    
    def segment_type=(value)
        @segment_type = value
    end
end