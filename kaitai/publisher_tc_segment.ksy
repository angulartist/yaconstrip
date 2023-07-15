meta:
  id: publisher_tc_segment
  endian: be
  title: 'Publisher Purposes Transparency and Consent'
seq:
  - id: segment_type
    type: b3
  - id: pub_purposes_consent
    type: b1
    repeat: expr
    repeat-expr: 24
  - id: pub_purposes_li_transparency
    type: b1
    repeat: expr
    repeat-expr: 24
  - id: num_custom_purposes
    type: b6
  - id: custom_purposes_consent
    type: b1
    repeat: expr
    repeat-expr: num_custom_purposes
    if: num_custom_purposes > 0
  - id: custom_purposes_li_transparency
    type: b1
    repeat: expr
    repeat-expr: num_custom_purposes
    if: num_custom_purposes > 0
