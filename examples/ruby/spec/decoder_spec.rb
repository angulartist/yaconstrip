require 'decoder'

RSpec.describe Decoder do
    describe '#initialize' do
        it 'can be initialized from String' do
          decoder = Decoder.new('CPu-GGyPu-GGyDHACAENCZCYAAAAAAAAAAQAAAAAAAAA')
        end
    end

    describe '#CoreStringSegment' do
        describe '#without vendors consent/li' do
            cs = 'CPu-GGyPu-GGyDHACAENCZCYAAAAAAAAAAQAAAAAAAAA.II7Nd_X__bX9n-_7_6ft0eY1f9_r37uQzDhfNs-8F3L_W_LwX32E7NF36tq4KmR4ku1bBIQNtHMnUDUmxaolVrzHsak2cpyNKJ_JkknsZe2dYGF9Pn9lD-YKZ7_5_9_f52T_9_9_-39z3_9f___dv_-__-vjf_599n_v9fV_78_Kf9______-____________8A'

            # IAB TCF Official decoder
            # https://iabtcf.com/#/decode
            #
            # Core string:
            # 000010 001111 101110 111110 000110 000110 110010 001111 101110 111110 
            # 000110 000110 110010 000011 000111 000000 000010 000000 000100 001101 
            # 000010 011001 000010 011000 000000 000000 000000 000000 000000 000000 
            # 000000 000000 000000 000000 010000 000000 000000 000000 000000 000000 
            # 000000 000000 000000 000000
            #
            # Disclosed vendors
            # 001000 001000 111011 001101 011101 111111 010111 111111 111111 011011 
            # 010111 111101 100111 111110 111111 111011 111111 111010 011111 101101 
            # 110100 011110 011000 110101 011111 111101 111111 101011 110111 111011 
            # 101110 010000 110011 000011 100001 011111 001101 101100 111110 111100 
            # 000101 110111 001011 111111 010110 111111 001011 110000 010111 110111 
            # 110110 000100 111011 001101 000101 110111 111010 101101 101010 111000 
            # 001010 100110 010001 111000 100100 101110 110101 011011 000001 001000 
            # 010000 001101 101101 000111 001100 100111 010100 000011 010100 100110 
            # 110001 011010 101000 100101 010101 101011 110011 000111 101100 011010 
            # 100100 110110 011100 101001 110010 001101 001010 001001 111111 001001 
            # 100100 100100 100111 101100 011001 011110 110110 011101 011000 000110 
            # 000101 111101 001111 100111 111101 100101 000011 111110 011000 001010 
            # 011001 111011 111111 111001 111111 111101 111111 011111 111001 110110 
            # 010011 111111 111101 111111 111101 111111 111110 110111 111101 110011 
            # 110111 111111 111101 011111 111111 111111 111111 011101 101111 111111 
            # 111110 111111 111111 111110 101111 100011 011111 111111 111001 111101 
            # 111101 100111 111111 101111 111101 011111 010101 111111 111011 111100 
            # 111111 001010 011111 111101 111111 111111 111111 111111 111111 111111 
            # 111110 111111 111111 111111 111111 111111 111111 111111 111111 111111 
            # 111111 111111 111111 111100 0000

            class Numeric
                Alpha26 = ("A".."Z").to_a
                def to_s26
                  return "" if self < 1
                  s, q = "", self
                  loop do
                    q, r = (q - 1).divmod(26)
                    s.prepend(Alpha26[r]) 
                    break if q.zero?
                  end
                  s
                end
            end
    
            decoder = Decoder.new(cs)
            decoded_segments = decoder.process()
            core_string_segment = decoded_segments[0]
    
            describe '#metadata' do
                it 'can decode the metadata' do
                    expect(core_string_segment.metadata.version).to eq(2)
                    expect(core_string_segment.metadata.created).to eq(1055884827)
                    expect(core_string_segment.metadata.created_overflow).to eq(2)
                    expect(core_string_segment.metadata.last_updated).to eq(1055884827)
                    expect(core_string_segment.metadata.last_updated_overflow).to eq(2)
                    expect(core_string_segment.metadata.last_updated_overflow).to eq(2)
                end
    
                describe '#consent management platform' do
                    it 'can decode the metadata.cmp' do
                        expect(core_string_segment.metadata.cmp.id).to eq(199)
                        expect(core_string_segment.metadata.cmp.version).to eq(2)
                        expect(core_string_segment.metadata.cmp.screen).to eq(0)
                    end
            
                    it 'can decode the metadata.cmp.language' do
                        expect(core_string_segment.metadata.cmp.language.left).to eq(4)
                        expect(core_string_segment.metadata.cmp.language.right).to eq(13)
                        # each numerical value starts at index 0
                        # so 0 = A, 1 = B etc.
                        left_letter = (core_string_segment.metadata.cmp.language.left + 1).to_s26
                        right_letter = (core_string_segment.metadata.cmp.language.right + 1).to_s26
                        # CMP language is set to EN (English)
                        expect(left_letter + right_letter).to eq("EN")
                    end
                end            
            end
            
            describe '#structure' do
                it 'can decode the structure' do
                    expect(core_string_segment.structure.policy_version).to eq(2)
                    expect(core_string_segment.structure.is_service_specific).to eq(false)
                    expect(core_string_segment.structure.use_non_standard_texts).to eq(true)
                    # the user has opted in for the first special feature only (1: true, 0: false)
                    expect(core_string_segment.structure.special_feature_opt_ins).to eq([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
                    # the user has opted out for all purposes
                    expect(core_string_segment.structure.purposes_consent).to eq([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
                    # the user has opted out for all legimate purposes
                    expect(core_string_segment.structure.purposes_li_transparency).to eq([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
                end
    
                describe '#specific juridiction disclosures' do
                    it 'can decode the structure specific juridiction disclosures' do
                        expect(core_string_segment.structure.sj_disclosures.purpose_one_treatment).to eq(false)
                    end
        
                    it 'can decode the structure.sj_disclosures publisher country' do
                        expect(core_string_segment.structure.sj_disclosures.pub_country.left).to eq(2)
                        expect(core_string_segment.structure.sj_disclosures.pub_country.right).to eq(0)
                        left_letter = (core_string_segment.structure.sj_disclosures.pub_country.left + 1).to_s26
                        right_letter = (core_string_segment.structure.sj_disclosures.pub_country.right + 1).to_s26
                        # Specific Juridiction Disclosures Publisher Country is set to CA (Canada? lol)
                        expect(left_letter + right_letter).to eq("CA")
                    end
                end
    
                describe '#vendors' do
                    it 'can decode the structure vendor consent' do
                        expect(core_string_segment.structure.vendor_consent.max_vendor_id).to eq(0)
                        expect(core_string_segment.structure.vendor_consent.is_range_encoding).to eq(false)
                        # user has opted out for all disclosed vendors, base consent
                        expect(core_string_segment.structure.vendor_consent.bit_field).to eq([])
                        # aditionally, the range section should not be used there
                        expect(core_string_segment.structure.vendor_consent.range_section).to eq(nil)
                    end
        
                    it 'can decode the structure vendor legitimate interest' do
                        expect(core_string_segment.structure.vendor_li.max_vendor_id).to eq(0)
                        expect(core_string_segment.structure.vendor_li.is_range_encoding).to eq(false)
                        # user has opted out for all disclosed vendors, base legitimate interest
                        expect(core_string_segment.structure.vendor_li.bit_field).to eq([])
                        # aditionally, the range section should not be used there
                        expect(core_string_segment.structure.vendor_li.range_section).to eq(nil)
                    end
                end
    
                describe '#publisher restrictions' do
                    it 'can decode the structure publisher restrictions' do
                        expect(core_string_segment.structure.pub_restrictions.num_pub_restrictions).to eq(0)
                    end
        
                    it 'can decode the structure publisher restrictions entries' do
                        # num_pub_restrictions = 0, so no entries to be expected
                        expect(core_string_segment.structure.pub_restrictions.pub_restriction_entries).to eq(nil)
                    end
                end
            end
        end

        describe '#with vendors consent/li' do
            describe '#structure' do
                describe '#vendors' do
                    describe '#bit field encoding' do
                        cs = 'CPvBAQ0PvBAQ0LHAAAENCZCAABAAAAgAAAAAAFhEgAWQGAAA.II7Nd_X__bX9n-_7_6ft0eY1f9_r37uQzDhfNs-8F3L_W_LwX32E7NF36tq4KmR4ku1bBIQNtHMnUDUmxaolVrzHsak2cpyNKJ_JkknsZe2dYGF9Pn9lD-YKZ7_5_9_f52T_9_9_-39z3_9f___dv_-__-vjf_599n_v9fV_78_Kf9______-____________8A'

                        # Core:
                        # 000010 001111 101111 000001 000000 010000 110100 001111 101111 000001 
                        # 000000 010000 110100 001011 000111 000000 000000 000000 000100 001101 
                        # 000010 011001 000010 000000 000000 000001 000000 000000 000000 000000 
                        # 100000 000000 000000 000000 000000 000000 000000 000101 100001 000100 
                        # 100000 000000 010110 010000 000110 000000 000000 000000

                        decoder = Decoder.new(cs)
                        decoded_segments = decoder.process()
                        core_string_segment = decoded_segments[0]

                        it 'can decode the structure vendor consent' do
                            # expected max vendor consent id is 11 (Quantcast)
                            expect(core_string_segment.structure.vendor_consent.max_vendor_id).to eq(11)
                            expect(core_string_segment.structure.vendor_consent.is_range_encoding).to eq(false)
                            # the user has opted-in for 3 vendor consents: 4 (Roq), 8 (Emerse), 11 (Quantcast)
                            expect(core_string_segment.structure.vendor_consent.bit_field).to eq([0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1])
                            expect(core_string_segment.structure.vendor_consent.range_section).to eq(nil)
                        end
            
                        it 'can decode the structure vendor legitimate interest' do
                            # expected max vendor leg int id is 11 (Quantcast)
                            expect(core_string_segment.structure.vendor_li.max_vendor_id).to eq(11)
                            expect(core_string_segment.structure.vendor_li.is_range_encoding).to eq(false)
                            # the user has opted-in for 3 vendor leg int: 2 (Captify), 10 (Index Exchange), 11 (Quantcast)
                            expect(core_string_segment.structure.vendor_li.bit_field).to eq([0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1])
                            expect(core_string_segment.structure.vendor_li.range_section).to eq(nil)
                        end
                    end

                    describe '#range section encoding' do
                        cs = 'CPvBCaFPvBCaFJ4AAAENCZCAAAAAAAAAAAAAI7QAwABAAEgjqCOwI7QAoAAgAFBHUEdgAA.II7Nd_X__bX9n-_7_6ft0eY1f9_r37uQzDhfNs-8F3L_W_LwX32E7NF36tq4KmR4ku1bBIQNtHMnUDUmxaolVrzHsak2cpyNKJ_JkknsZe2dYGF9Pn9lD-YKZ7_5_9_f52T_9_9_-39z3_9f___dv_-__-vjf_599n_v9fV_78_Kf9______-____________8A'

                        # It opt-in for vendors at the beginning and at the end of the list
                        # creating a huge gap to force the algorithm to use
                        # range section encoding instead of bit field
                        # because bit field would have to waste a lof of space
                        # by filling the array with zeros.
                        #    head    nothing     tail
                        # [1,    1,    ...,    1,    1] bit field

                        decoder = Decoder.new(cs)
                        decoded_segments = decoder.process()
                        core_string_segment = decoded_segments[0]

                        it 'can decode the structure vendor consent' do
                            # user has opted-in for vendor consents: 2, 4, 1141, 1142
                            expect(core_string_segment.structure.vendor_consent.max_vendor_id).to eq(1142)
                            expect(core_string_segment.structure.vendor_consent.is_range_encoding).to eq(true)
                            expect(core_string_segment.structure.vendor_consent.bit_field).to eq(nil)
                            expect(core_string_segment.structure.vendor_consent.range_section.num_entries).to eq(3)
                            expect(core_string_segment.structure.vendor_consent.range_section.range_entries[0].is_a_range).to eq(false)
                            expect(core_string_segment.structure.vendor_consent.range_section.range_entries[0].start_or_only_vendor_id).to eq(2)
                            expect(core_string_segment.structure.vendor_consent.range_section.range_entries[0].end_vendor_id).to eq(nil)
                            expect(core_string_segment.structure.vendor_consent.range_section.range_entries[1].is_a_range).to eq(false)
                            expect(core_string_segment.structure.vendor_consent.range_section.range_entries[1].start_or_only_vendor_id).to eq(4)
                            expect(core_string_segment.structure.vendor_consent.range_section.range_entries[1].end_vendor_id).to eq(nil)
                            expect(core_string_segment.structure.vendor_consent.range_section.range_entries[2].is_a_range).to eq(true)
                            expect(core_string_segment.structure.vendor_consent.range_section.range_entries[2].start_or_only_vendor_id).to eq(1141)
                            expect(core_string_segment.structure.vendor_consent.range_section.range_entries[2].end_vendor_id).to eq(1142)
                        end
            
                        it 'can decode the structure vendor legitimate interest' do
                             # user has opted-in for vendor leg int: 1, 2, 1141, 1142
                            expect(core_string_segment.structure.vendor_li.max_vendor_id).to eq(1142)
                            expect(core_string_segment.structure.vendor_li.is_range_encoding).to eq(true)
                            expect(core_string_segment.structure.vendor_li.bit_field).to eq(nil)
                            expect(core_string_segment.structure.vendor_li.range_section.num_entries).to eq(2)
                            expect(core_string_segment.structure.vendor_li.range_section.range_entries[0].is_a_range).to eq(true)
                            expect(core_string_segment.structure.vendor_li.range_section.range_entries[0].start_or_only_vendor_id).to eq(1)
                            expect(core_string_segment.structure.vendor_li.range_section.range_entries[0].end_vendor_id).to eq(2)
                            expect(core_string_segment.structure.vendor_li.range_section.range_entries[1].is_a_range).to eq(true)
                            expect(core_string_segment.structure.vendor_li.range_section.range_entries[1].start_or_only_vendor_id).to eq(1141)
                            expect(core_string_segment.structure.vendor_li.range_section.range_entries[1].end_vendor_id).to eq(1142)
                        end
                    end
                end
            end
        end
    end

    describe '#DisclosedVendorsSegment' do
        cs = 'CPu-GGyPu-GGyDHACAENCZCYAAAAAAAAAAQAAAAAAAAA.II7Nd_X__bX9n-_7_6ft0eY1f9_r37uQzDhfNs-8F3L_W_LwX32E7NF36tq4KmR4ku1bBIQNtHMnUDUmxaolVrzHsak2cpyNKJ_JkknsZe2dYGF9Pn9lD-YKZ7_5_9_f52T_9_9_-39z3_9f___dv_-__-vjf_599n_v9fV_78_Kf9______-____________8A'

        decoder = Decoder.new(cs)
        decoded_segments = decoder.process()
        disclosed_vendors_segment = decoded_segments[1]

        it 'can decode the disclosed vendors segment' do
            expect(disclosed_vendors_segment.segment_type).to eq(1) # 001
            # expected 792 disclosed vendors
            # using the bit field algorithm
            expect(disclosed_vendors_segment.vendor_consent.max_vendor_id).to eq(1142)
            expect(disclosed_vendors_segment.vendor_consent.is_range_encoding).to eq(false)
            expect(disclosed_vendors_segment.vendor_consent.bit_field).to eq([1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,0,1,1,1,1,1,1,1,0,1,1,0,0,
                1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,1,1,1,1,1,1,0,1,1,0,1,1,1,0,1,0,0,0,1,1,1,1,0,0,1,1,0,0,0,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,
                1,1,0,1,0,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,0,1,1,1,0,0,1,0,0,0,0,1,1,0,0,1,1,0,0,0,0,1,1,1,0,0,0,0,1,0,1,1,1,1,1,0,0,1,1,0,1,1,0,1,1,0,0,1,1,1,1,1,0,1,1,1,1,0,0,0,0,0,1,0,1,1,
                1,0,1,1,1,0,0,1,0,1,1,1,1,1,1,1,1,0,1,0,1,1,0,1,1,1,1,1,1,0,0,1,0,1,1,1,1,0,0,0,0,0,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,0,0,0,0,1,0,0,1,1,1,0,1,1,0,0,1,1,0,1,0,0,0,1,0,1,1,1,0,
                1,1,1,1,1,1,0,1,0,1,0,1,1,0,1,1,0,1,0,1,0,1,1,1,0,0,0,0,0,1,0,1,0,1,0,0,1,1,0,0,1,0,0,0,1,1,1,1,0,0,0,1,0,0,1,0,0,1,0,1,1,1,0,1,1,0,1,0,1,0,1,1,0,1,1,0,0,0,0,0,1,0,0,1,0,0,
                0,0,1,0,0,0,0,0,0,1,1,0,1,1,0,1,1,0,1,0,0,0,1,1,1,0,0,1,1,0,0,1,0,0,1,1,1,0,1,0,1,0,0,0,0,0,0,1,1,0,1,0,1,0,0,1,0,0,1,1,0,1,1,0,0,0,1,0,1,1,0,1,0,1,0,1,0,0,0,1,0,0,1,0,1,0,
                1,0,1,0,1,1,0,1,0,1,1,1,1,0,0,1,1,0,0,0,1,1,1,1,0,1,1,0,0,0,1,1,0,1,0,1,0,0,1,0,0,1,1,0,1,1,0,0,1,1,1,0,0,1,0,1,0,0,1,1,1,0,0,1,0,0,0,1,1,0,1,0,0,1,0,1,0,0,0,1,0,0,1,1,1,1,
                1,1,1,0,0,1,0,0,1,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,1,1,1,0,1,1,0,0,0,1,1,0,0,1,0,1,1,1,1,0,1,1,0,1,1,0,0,1,1,1,0,1,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,1,0,1,1,1,1,1,0,1,0,0,1,1,1,
                1,1,0,0,1,1,1,1,1,1,1,0,1,1,0,0,1,0,1,0,0,0,0,1,1,1,1,1,1,1,0,0,1,1,0,0,0,0,0,1,0,1,0,0,1,1,0,0,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,
                1,1,1,1,1,1,1,1,0,0,1,1,1,0,1,1,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,0,1,1,1,0,0,1,1,1,1,0,1,1,1,1,1,1,
                1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,0,0,1,
                1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,0,0,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,0,0,1,
                1,1,1,1,1,0,0,1,0,1,0,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
            expect(disclosed_vendors_segment.vendor_consent.range_section).to eq(nil)
        end
    end

    describe '#PublisherTcSegment' do
       # TODO:
    end
end