from construct import *
from construct.lib import *

disclosed_vendors_segment__vendor_section = Struct(
	'max_vendor_id' / ???,
	'is_range_encoding' / ???,
	'bit_field' / If(not (this.is_range_encoding), Array(this.max_vendor_id, ???)),
	'range_section' / If(this.is_range_encoding, LazyBound(lambda: disclosed_vendors_segment__range_section)),
)

disclosed_vendors_segment__range_section = Struct(
	'num_entries' / ???,
	'range_entries' / Array(this.num_entries, LazyBound(lambda: disclosed_vendors_segment__range_entry)),
)

disclosed_vendors_segment__range_entry = Struct(
	'is_a_range' / ???,
	'start_or_only_vendor_id' / ???,
	'end_vendor_id' / If(this.is_a_range, ???),
)

disclosed_vendors_segment = Struct(
	'segment_type' / ???,
	'vendor_consent' / LazyBound(lambda: disclosed_vendors_segment__vendor_section),
)

_schema = disclosed_vendors_segment
