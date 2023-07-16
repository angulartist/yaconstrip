require 'base64'

require_relative '../compiled-ksy/core_string_segment'
require_relative '../compiled-ksy/disclosed_vendors_segment'
require_relative '../compiled-ksy/publisher_tc_segment'

require_relative 'unaligned_kaitai_stream'

class Decoder
    def initialize(consent_string)
        @consent_string = consent_string
    end

    def base64_to_bit_stream(segment)
        data = Base64.urlsafe_decode64(segment)

        return UnalignedKaitaiStream.new(data)
    end

    def process
        segments = @consent_string.split('.')
        puts "Found #{segments.length} segments in the provided TC String."

        if segments.length < 2
            raise Exception.new "Expecting at least two segments in the TC String (Core + Publisher TC)."
        end


        return segments.map.with_index do |segment, index|
            puts "Working on segment #{segment}, index=#{index}"
            stream = self.base64_to_bit_stream(segment)
            
            if index === 0
                # we assume that's the Core String
                # as it's always the head of the TC String
                stream.segment_type = 0
            else
                stream.read_segment_type
            end
                        
            case stream.segment_type
            when 0
                CoreStringSegment.new(stream)
            when 1
                DisclosedVendorsSegment.new(stream)
            when 2
                PublisherTcSegment.new(stream)
            else
                {}
            end
        end
    end

end