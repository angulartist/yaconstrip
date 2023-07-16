from construct import *
from construct.lib import *

publisher_tc_segment = Struct(
	'segment_type' / ???,
	'pub_purposes_consent' / Array(24, ???),
	'pub_purposes_li_transparency' / Array(24, ???),
	'num_custom_purposes' / ???,
	'custom_purposes_consent' / If(this.num_custom_purposes > 0, Array(this.num_custom_purposes, ???)),
	'custom_purposes_li_transparency' / If(this.num_custom_purposes > 0, Array(this.num_custom_purposes, ???)),
)

_schema = publisher_tc_segment
