meta:
  id: core_string_segment
  endian: be
  title: 'The Core String'
seq:
  - id: metadata
    type: metadata
  - id: structure
    type: structure
types:
  alpha:
    seq:
      - id: left
        type: b6
      - id: right
        type: b6
  metadata:
    types:
      cmp:
        doc: 'Consent Management Platform'
        seq:
          - id: id
            type: b12
          - id: version
            type: b12
          - id: screen
            type: b6
          - id: language
            doc: 'ISO 3166-1 alpha-2 code used identify a country or a language'
            type: alpha
    doc: 'TC Consent Management Platform'
    seq:
      - id: version
        doc: 'Supported version is above 2 (TCF 2.O)'
        type: b6
      - id: created
        doc: 'Timestamp'
        type: b32 # TMP: Javascript doesn't support more than 32 bits.
      - id: created_overflow
        doc: 'Timestamp'
        type: b4
      - id: last_updated
        doc: 'Timestamp'
        type: b32 # TMP: Javascript doesn't support more than 32 bits.
      - id: last_updated_overflow
        doc: 'Timestamp'
        type: b4
      - id: cmp
        type: cmp
      - id: gvl_version
        doc: 'Global Vendor List version'
        type: b12
  structure:
    seq:
      - id: policy_version
        type: b6
      - id: is_service_specific
        type: b1
      - id: use_non_standard_texts
        type: b1
      - id: special_feature_opt_ins
        type: b1
        repeat: expr
        repeat-expr: 12
      - id: purposes_consent
        type: b1
        repeat: expr
        repeat-expr: 24
      - id: purposes_li_transparency
        type: b1
        repeat: expr
        repeat-expr: 24
      - id: sj_disclosures
        doc: 'Specific Jurisdiction Disclosures'
        type: sj_disclosures
      - id: vendor_consent
        type: vendor_section
      - id: vendor_li
        type: vendor_section
      - id: pub_restrictions
        type: pub_restrictions_section
    types:
      sj_disclosures:
        doc: 'Specific Jurisdiction Disclosures'
        seq:
          - id: purpose_one_treatment
            type: b1
          - id: pub_country
            doc: 'Publisher Country Code'
            type: alpha
      range_section:
        seq:
          - id: num_entries
            type: b12
          - id: range_entries
            type: range_entry
            repeat: expr
            repeat-expr: num_entries
      range_entry:
        seq:
          - id: is_a_range
            type: b1
          - id: start_or_only_vendor_id
            type: b16
          - id: end_vendor_id
            type: b16
            if: is_a_range
      vendor_section:
        seq:
          - id: max_vendor_id
            type: b16
          - id: is_range_encoding
            type: b1
          - id: bit_field
            type: b1
            repeat: expr
            repeat-expr: max_vendor_id
            if: not is_range_encoding
          - id: range_section
            type: range_section
            if: is_range_encoding
      pub_restrictions_section:
        types:
          pub_restriction_entry:
            seq:
              - id: purpose_id
                type: b6
              - id: restriction_type
                type: b2
              - id: range_section
                type: range_section
              - id: num_entries
                type: b12
              - id: range_entries
                type: range_entry
                repeat: expr
                repeat-expr: num_entries
        seq:
          - id: num_pub_restrictions
            type: b12
          - id: pub_restriction_entries
            type: pub_restriction_entry
            repeat: expr
            repeat-expr: num_pub_restrictions
            if: num_pub_restrictions > 0
