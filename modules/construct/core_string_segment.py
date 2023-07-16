from construct import *
from construct.lib import *

core_string_segment__alpha = Struct(
	'left' / ???,
	'right' / ???,
)

core_string_segment__metadata__cmp = Struct(
	'id' / ???,
	'version' / ???,
	'screen' / ???,
	'language' / LazyBound(lambda: core_string_segment__alpha),
)

core_string_segment__metadata = Struct(
	'version' / ???,
	'created' / ???,
	'created_overflow' / ???,
	'last_updated' / ???,
	'last_updated_overflow' / ???,
	'cmp' / LazyBound(lambda: core_string_segment__metadata__cmp),
	'gvl_version' / ???,
)

core_string_segment__structure__pub_restrictions_section__pub_restriction_entry = Struct(
	'purpose_id' / ???,
	'restriction_type' / ???,
	'range_section' / LazyBound(lambda: core_string_segment__structure__range_section),
	'num_entries' / ???,
	'range_entries' / Array(this.num_entries, LazyBound(lambda: core_string_segment__structure__range_entry)),
)

core_string_segment__structure__pub_restrictions_section = Struct(
	'num_pub_restrictions' / ???,
	'pub_restriction_entries' / If(this.num_pub_restrictions > 0, Array(this.num_pub_restrictions, LazyBound(lambda: core_string_segment__structure__pub_restrictions_section__pub_restriction_entry))),
)

core_string_segment__structure__vendor_section = Struct(
	'max_vendor_id' / ???,
	'is_range_encoding' / ???,
	'bit_field' / If(not (this.is_range_encoding), Array(this.max_vendor_id, ???)),
	'range_section' / If(this.is_range_encoding, LazyBound(lambda: core_string_segment__structure__range_section)),
)

core_string_segment__structure__range_section = Struct(
	'num_entries' / ???,
	'range_entries' / Array(this.num_entries, LazyBound(lambda: core_string_segment__structure__range_entry)),
)

core_string_segment__structure__sj_disclosures = Struct(
	'purpose_one_treatment' / ???,
	'pub_country' / LazyBound(lambda: core_string_segment__alpha),
)

core_string_segment__structure__range_entry = Struct(
	'is_a_range' / ???,
	'start_or_only_vendor_id' / ???,
	'end_vendor_id' / If(this.is_a_range, ???),
)

core_string_segment__structure = Struct(
	'policy_version' / ???,
	'is_service_specific' / ???,
	'use_non_standard_texts' / ???,
	'special_feature_opt_ins' / Array(12, ???),
	'purposes_consent' / Array(24, ???),
	'purposes_li_transparency' / Array(24, ???),
	'sj_disclosures' / LazyBound(lambda: core_string_segment__structure__sj_disclosures),
	'vendor_consent' / LazyBound(lambda: core_string_segment__structure__vendor_section),
	'vendor_li' / LazyBound(lambda: core_string_segment__structure__vendor_section),
	'pub_restrictions' / LazyBound(lambda: core_string_segment__structure__pub_restrictions_section),
)

core_string_segment = Struct(
	'metadata' / LazyBound(lambda: core_string_segment__metadata),
	'structure' / LazyBound(lambda: core_string_segment__structure),
)

_schema = core_string_segment
